<arjuna>
  <div if={!deck.length}>
    <h2>Arjuna: Choose factions to include.</h2>
    <form onsubmit={start}>
      <div each={cards, name in factions} class="form-check">
        <input class="form-check-input" type="checkbox" id="{name}" checked />
        <label class="form-check-label" for="{name}">{name}</label>
      </div>
      <input type="submit" />
    </form>
  </div>

  <div if={deck.length}>
    <h2>Arjuna: Resolve the card or <a onclick={shuffle} href="#">shuffle</a>.</h2>
    <img src="img/{card()}.png" class="img-fluid" alt="{card()}" />
    <div role="group">
      <button onclick={next}
        type="button" class="btn btn-secondary">Next</button>
      <button onclick={flip}
        type="button" class="btn btn-secondary" disabled={flipside}>Flip</button>
      <button onclick={stop}
        type="button" class="btn btn-secondary">Stop</button>
    </div>
  </div>

  <!-- Log messages in CSV. -->
  <form onsubmit={journal}>
    <input ref="message" />
    <input type="submit" />
  </form>
  <pre class="pre-scrollable">{messages.join('\n')}</pre>

  <script>
  // JavaScript logic for the tag.
  this.factions = {
    // Cards to include for the four factions.
    'raj': ['a', 'b', 'c', 'd', 'e', 'f'],
    'inc': ['g', 'h', 'j', 'k', 'l', 'm'],
    'ml': ['n', 'p', 'q', 'r', 's', 't'],
    'rev': ['u', 'v', 'w', 'x', 'y', 'z']
  };
  this.messages = ["Card,Event"];

  // For working through the deck.
  this.index = 0;
  this.flipside = false;
  this.deck = [];

  log(msg) {
    this.messages.push([this.card(), msg].join(','));
  }

  journal(e) {
    this.log(this.refs.message.value);
    this.refs.message.value = "";
  }

  // Construct the deck, shuffle it, and log a start.
  start(e) {
    this.deck = [];
    for (var i = 0; i < 4; i++) {
      if (e.target[i].checked) {
        var cards = this.factions[e.target[i].id];
        this.deck = this.deck.concat(cards);
      }
    }
    this.shuffle();
    console.log(this.deck);
    this.log("START");
  }

  // Fisher–Yates shuffle
  shuffle() {
    deck = this.deck;
    var i = deck.length;
    while (0 !== i) {
      var j = Math.floor(Math.random() * i);
      i -= 1;

      var tmp = deck[i];
      deck[i] = deck[j];
      deck[j] = tmp;
    }
    this.index = 0;
  }

  card() {
    var id = this.deck[this.index];
    return this.flipside ? id + '2' : id + '1';
  }

  next() {
    this.log("next");
    this.index = (this.index + 1) % this.deck.length;
  }

  flip() {
    this.log("flip");
    this.flipside = !this.flipside;
  }

  stop() {
    this.log("stop");
    this.flipside = false;
    this.next();
  }
  </script>

</arjuna>
