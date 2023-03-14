import { Component, onMount } from "solid-js"

export interface ThemeColors {
    primary: string,
    secondary: string,
    accent: string,
}

interface ThemeProps {
    schema: ThemeColors,
}

export const light: ThemeColors = {
    primary: 'red',
    secondary: 'white',
    accent: 'grey',
}

export const current = light

const Theme:Component<ThemeProps> = ({ schema }) => {
    const css = `
        :root {
            --primary: ${schema.primary};
            --secondary: ${schema.secondary};
            --accent: ${schema.accent};
        }
        div, button, input {
            box-sizing: border-box;
        }
        button, input {
            outline: none;
            border: none;
            -webkit-appearance: none;
            -ms-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }
        #root {
            height: 100vh;
        }
    `

    onMount(() => {
        const head = document.getElementsByTagName('head')[0]
        const style = document.createElement('style')
        head.appendChild(style)
        style.appendChild(document.createTextNode(css))
    })

    return (<></>)
}

export default Theme

