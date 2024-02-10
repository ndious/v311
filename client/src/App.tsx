import { Component, Match, Switch } from 'solid-js'
import { createSignal } from 'solid-js'
import 'reset-css'

import { HomePage, NewPage } from './pages'
import QrInput from './components/qr-input'
import Theme, { light } from './components/theme'

import styles from './App.module.css'
import { search } from './core/request'

const App: Component = () => {
  const [page, setPage] = createSignal('unassigned')
  const [params, setParams] = createSignal({})
  const linkTo = (page:string, params:{}|null) => {
    setPage(page)
    setParams(params ?? {})
  }
  const onSearchUpdate = (value: string) => {
    search(value).then(({ type, payload }) => {
        linkTo(type, payload)
    })
  }

  return (
    <div class={styles.App}>
      <Theme schema={light} />
      <div>
        <div class={styles.title}>V311</div>
      </div>
      <QrInput minLength={2} onUpdate={onSearchUpdate}/>
      <Switch>
        <Match when={page() === 'home'}>
          <HomePage setPage={setPage} />
        </Match>
        <Match when={page() === 'unassigned'}>
          <NewPage linkTo={linkTo} params={params} />
        </Match>
      </Switch>
    </div>
  );
};

export default App;
