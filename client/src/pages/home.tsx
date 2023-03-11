import type { Component, Setter } from "solid-js";

interface HomeProps{
    setPage: Setter<string>
}
const Home: Component<HomeProps> = ({ setPage }:HomeProps) => {

    return (
      <div>
        <button>Print Sheet</button>
      </div>
    )
};

export default Home;
