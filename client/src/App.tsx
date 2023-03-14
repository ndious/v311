import { Component, Match, Switch } from 'solid-js'
import { createSignal } from 'solid-js'
import 'reset-css'

import { HomePage, NewPage } from './pages'
import QrInput from './components/qr-input'
import Theme, { light } from './components/theme'

import styles from './App.module.css'

const App: Component = () => {
  const [page, setPage] = createSignal('new')
  const [params, setParams] = createSignal({})
  const linkTo = (page:string, params:{} = {}) => {
    setPage(page)
    setParams(params)
  }

  return (
    <div class={styles.App}>
      <Theme schema={light} />
      <div>
        <div>V311</div>
      </div>
      <QrInput />
      <Switch>
        <Match when={page() === 'home'}>
          <HomePage setPage={setPage} />
        </Match>
        <Match when={page() === 'new'}>
          <NewPage setPage={linkTo} params={params} />
        </Match>
      </Switch>
    </div>
  );
};

export default App;
