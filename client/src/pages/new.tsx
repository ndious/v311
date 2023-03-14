import { PageComponent } from "./../interfaces/pages";
import { BiSolidPackage, BiSolidTShirt } from 'solid-icons/bi'

import styles from './__style/new.module.css'
import { current } from "../components/theme";

const Page: PageComponent = ({ linkTo, params }) => (
  <div class={styles.new__wrapper}>
      <button class={styles.new__btn} onClick={() => linkTo('newItem', { ...params() })}>
        <span class={styles.new__ico}><BiSolidTShirt size={24} color={current.secondary} /></span>
        Create an item
      </button>
      <button class={styles.new__btn} onClick={() => linkTo('newContainer', { ...params() })}>
        <span class={styles.new__ico}><BiSolidPackage size={24} color={current.secondary} /></span>
        Create an container
      </button>
  </div>
)

export default Page
