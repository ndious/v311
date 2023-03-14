import { Component, createSignal, Show } from "solid-js";
import { HiSolidCamera, HiSolidPaperAirplane } from 'solid-icons/hi'

import Scanner from './scanner'
import styles from './__styles/qr-input.module.css'
import { current } from "./theme";

interface QrInputProps {
    onFullfilled: (a: string) => void|null
    isSubmitable: boolean|null
}

const QrInput:Component<QrInputProps> = ({ isSubmitable, onFullfilled }) => {
    const [isScanOpen, setIsOpen] = createSignal(false)
    const [value, setValue] = createSignal('')
    const updateValue = (val:string) => {
        setValue(val)
        if (onFullfilled !== null && val.length === 6) {
            onFullfilled(val)
        }
    }

    return (
        <div class={styles.qr__container}>
            <div class={styles.qr__icon} onClick={() => setIsOpen(true)}>
                <HiSolidCamera size={24} color={current.secondary} />
            </div>
            <input type="text" 
                value={value()} 
                onInput={({ target }) => updateValue((target as HTMLInputElement).value)} 
                class={styles.qr__input} 
            />
            <Show when={isSubmitable}>
                <div class={styles.qr__icon}><HiSolidPaperAirplane /></div>
            </Show>
            <dialog class={styles.qr__dialog} open={isScanOpen()}>
                <Show when={isScanOpen()}>
                    <Scanner onCapture={(value:string) => {
                        updateValue(value)
                        setIsOpen(false)
                    }} />
                    <button onClick={() => setIsOpen(false)}>close</button>
                </Show>
            </dialog>
        </div>
    )
}

export default QrInput
