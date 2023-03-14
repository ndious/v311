import type { Component, Accessor } from 'solid-js'

type Params = { [key: string]: string|[] }

export interface PageProps{
    linkTo: (page: string, params: Params | null) => void,
    params: Accessor<Params>,
}

export type PageComponent = Component<PageProps>
