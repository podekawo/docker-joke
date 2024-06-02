<script lang="ts">

	interface Response {

		error: boolean;
		category: string;
		type: string;
		joke: string;
		flags: {
			nsfw: boolean;
			religious: boolean;
			political: boolean;
			racist: boolean;
			sexist: boolean;
			explicit: boolean;
		};
		id: number;
		safe: boolean;
		lang: string;
	
	}

	$: joke = ''

	async function request() {
		
		const res = await fetch("https://v2.jokeapi.dev/joke/Programming?type=single&contains=joke", {
			method: "GET",
		});

		const json: Response = await res.json();
		
		console.log(json)

		joke = JSON.stringify(json.joke);
	
	}

</script>

<h1 class="title">Joke Master</h1>

<button on:click={request}>Request a joke</button>

<h1 class="joke">{joke}</h1>

<style>
	
	.title {

		color: #222;

	}

	button {

		padding: 8px;
		border-radius: .25rem;
		outline: none;

		font-size: 1.5em;
		
	}

	button:hover {

		color: #222;
		background-color: var(--color-theme-1);

		text-decoration: underline;

	}

	.joke {

		color: #222;

	}

</style>
