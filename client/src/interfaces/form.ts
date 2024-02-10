import { Accessor, Component, Setter } from "solid-js";
import { SetStoreFunction, Store } from "solid-js/store";
import { Obj } from "./global";

export interface InputProps {
    name: string,
    label: string,
    state: Store<Obj>,
    setState: SetStoreFunction<Obj>,
}

export type InputComponent = Component<InputProps>

