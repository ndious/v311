export interface QrResultScanner {
    cornerPoints: any,
    data: string
}

export interface Camera {
    id: string
    label: string
}

export type Cameras = Array<Camera>

