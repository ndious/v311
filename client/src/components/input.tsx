import { Accessor, Component, createSignal, Setter, Show } from "solid-js";
import styles from './__styles/input.module.css'

interface InputProps {
    name: string,
    label: string,
    onInput: Setter<string>,
    error: Accessor<string>,
}

const Input:Component<InputProps> = ({ name, label, onInput, error }) => {
    const [ value, setValue ] = createSignal('')
    const onChange = (val: string) => { 
        setValue(val)
        onInput(val)
    }

    return (
        <div class={styles.input__row}>
            <label class={styles.input__label} for={name}>
                {label}
                <div class={styles.inv}></div>
            </label>
            <input 
                class={styles.input__field}
                value={value()} 
                onInput={({ target }) => onChange((target as HTMLInputElement).value)} 
                id={name} 
                name={name} 
            />
            <Show when={error().length !== 0}>
                <div class={styles.input__err}>{error()}</div>
            </Show>
        </div>
    )
}

export default Input

