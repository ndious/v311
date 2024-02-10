import { Accessor, Component, Show } from "solid-js";
import { InputComponent } from "../interfaces/form";
import styles from './__styles/input.module.css'

const noop = () => ''

const Input:InputComponent = ({ name, label, state, setState }) => {
    const err: Accessor<string> =  noop

    return (
        <div class={styles.input__row}>
            <label class={styles.input__label} for={name}>
                {label}
                <div class={styles.inv}></div>
            </label>
            <input 
                class={styles.input__field}
                value={state[name]} 
                onInput={({ target }) => setState(name, (target as HTMLInputElement).value)} 
                id={name} 
                name={name} 
            />
            <Show when={err().length !== 0}>
                <div class={styles.input__err}>{err()}</div>
            </Show>
        </div>
    )
}

export default Input

