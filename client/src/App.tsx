import { Component, Match, Switch } from 'solid-js'
import { createSignal } from 'solid-js'
import 'reset-css'

import { HomePage, ScanPage } from './pages'
import QrInput from './components/qr-input'

import styles from './App.module.css'

const App: Component = () => {
  const [page, setPage] = createSignal('home')
  const [params, setParams] = createSignal({})
  const href = (page:string, params:{} = {}) => {
    setPage(page)
    setParams(params)
  }

  return (
    <div class={styles.App}>
      <div>
        <div>Vault311</div>
      </div>
      <QrInput />
      <Switch>
        <Match when={page() === 'home'}>
          <HomePage setPage={setPage} />
        </Match>
        <Match when={page() === 'scan'}>
          <ScanPage setPage={setPage} />
        </Match>
      </Switch>
    </div>
  );
};

export default App;
