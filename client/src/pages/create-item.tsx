import { createStore, Getter } from 'solid-js/store'
import Input from '../components/input'
import { PageComponent } from '../interfaces/pages'

interface Form {
    item_code: string,
    name: string,
    container: string,
    photo: string,
}

const Page: PageComponent = ({ linkTo, params }) => {
  const [ store, setStore ] = createStore({
    item_code: '',
    name: '',
    container: '',
    photo: '',
  })
  return (
    <div>
      <Input name="code" label="Code" store={store} onInput={setStore} />
    </div>
  )
}
