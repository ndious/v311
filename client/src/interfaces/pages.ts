import type { Component, Accessor } from 'solid-js'
import { Obj } from './global'

export interface PageProps {
    linkTo: (page: string, params: Obj | null) => void,
    params: Accessor<Obj>,
}

export type PageComponent = Component<PageProps>
