import { Component, createSignal, Show } from "solid-js";
import { HiSolidCamera, HiSolidPaperAirplane } from 'solid-icons/hi'

import Scanner from './scanner'
import styles from './__styles/qr-input.module.css'

interface QrInputProps {
    isSubmitable: boolean|null
}

const QrInput:Component<QrInputProps> = ({ isSubmitable }) => {
    const [isScanOpen, setIsOpen] = createSignal(false)
    const [value, setValue] = createSignal('')

    return (
        <div class={styles.qr__container}>
            <div class={styles.qr__icon} onClick={() => setIsOpen(true)}>
                <HiSolidCamera size={24} color="#ffffff"/>
            </div>
            <input type="text" 
                value={value()} 
                onInput={(ev) => setValue(ev.target.value)} 
                class={styles.qr__input} 
            />
            <Show when={isSubmitable}>
                <div class={styles.qr__icon}><HiSolidPaperAirplane /></div>
            </Show>
            <dialog class={styles.qr__dialog} open={isScanOpen()}>
                <Show when={isScanOpen()}>
                    <Scanner onCapture={(value:string) => {
                        setValue(value)
                        setIsOpen(false)
                    }} />
                    <button onClick={() => setIsOpen(false)}>close</button>
                </Show>
            </dialog>
        </div>
    )
}

export default QrInput
