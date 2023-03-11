import type { Component, Setter } from 'solid-js'

export interface PageProps{
    setPage: Setter<string>
}

export type PageComponent = Component<PageProps>
