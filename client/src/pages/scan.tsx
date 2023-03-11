import { createSignal, For, onCleanup, onMount } from 'solid-js'
import QrScanner from 'qr-scanner'
import { PageComponent, PageProps } from "./../interfaces/pages";
import { QrResultScanner, Cameras, Camera } from "./../interfaces/qrcode";
import styles from './__style/scanner.module.css'

const Page: PageComponent = ({ setPage }:PageProps) => {
    let video:HTMLVideoElement;
    let scanner:any;
    const [qrResult, setQrResult] = createSignal('')
    const [cameras, setCameras] = createSignal([])
    const [isLandscape, setIsLandscape] = createSignal(false)
    const getVideoSize = () => setIsLandscape(video.videoWidth > video.videoHeight)

    onMount(() => {
        scanner = new QrScanner(video, (result:QrResultScanner) => {
            setQrResult(result.data)
        }, {
            onDecodeError: (error:string) => {
                if (error !== qrResult()) {
                    setQrResult(error)
                }
            },
            highlightScanRegion: true,
            highlightCodeOutline: true,
        });

        scanner.start().then(() => {
            //updateFlashAvailability();
            // List cameras after the scanner started to avoid listCamera's stream and the scanner's stream being requested
            // at the same time which can result in listCamera's unconstrained stream also being offered to the scanner.
            // Note that we can also start the scanner after listCameras, we just have it this way around in the demo to
            // start the scanner earlier.
            QrScanner.listCameras(true).then((cams:Cameras) => setCameras(cams))
        })

        video.addEventListener('playing', getVideoSize)
    })

    onCleanup(() => {
        scanner.stop()
        video.removeEventListener('playing', getVideoSize)
    })

    return (
      <div>
        <div class={styles.reader}>
            <video style={`${isLandscape ? 'height' : 'width'}: 100%`} ref={video}></video>
        </div>
        <div>{qrResult()}</div>
        <select>
          <For each={cameras()}>{(cam:Camera) => 
            <option value={cam.id}>{cam.label}</option>
          }</For>
        </select>
      </div>
    )
}

export default Page
