<arjuna>
  <div class="card text-center w-100" if={!deck.length}>
    <div class="card-body">
    <h5 class="card-title">Arjuna: Choose factions to include.</h5>
    <form onsubmit={start}>
      <div each={cards, name in factions} class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="{name}" checked />
        <label class="form-check-label" for="{name}">{name}</label>
      </div>
      <button type="submit" class="btn btn-primary">Start</button>
    </form>
    </div>
  </div>

  <div class="card text-center w-100" if={deck.length}>
    <div class="card-body">
      <img src="img/{card()}.png" class="card-img-top" alt="{card()}" />
      <div role="group">
        <button onclick={discard}
          type="button" class="btn btn-lg btn-primary">Discard</button>
        <button onclick={flip}
          type="button" class="btn btn-lg btn-primary" disabled={flipside}>Flip</button>
        <button onclick={stop}
          type="button" class="btn btn-lg btn-primary">Stop</button>
        <button onclick={shuffle}
          type="button" class="btn btn-lg btn-warning">Shuffle</button>
        <button onclick={end}
          type="button" class="btn btn-lg btn-warning">Game End</button>
      </div>
    </div>
  </div>

  <!-- Log messages in CSV. -->
  <div class="container-fluid">
    <form onsubmit={journal} class="form-inline">
      <div class="form-group">
        <input class="form-control" ref="message" />
      </div>
      <button type="submit" class="btn btn-primary">Log</button>
    </form>
    <pre class="pre-scrollable">{messages.join('\n')}</pre>
  </div>

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
  this.stats = {};

  // For counting busy-work.
  this.discards = 0;
  this.flips = 0;

  log(msg) {
    this.messages.push([this.card(), msg].join(','));
    this.increment(msg); // track stats per card
  }

  journal(e) {
    e.preventDefault();
    this.log(this.refs.message.value);
    this.refs.message.value = "";
  }

  // Construct the deck, shuffle it, and log a start.
  start(e) {
    e.preventDefault();
    this.deck = [];
    for (var i = 0; i < 4; i++) {
      if (e.target[i].checked) {
        var cards = this.factions[e.target[i].id];
        this.deck = this.deck.concat(cards);
      }
    }
    this.shuffle();
    this.log("start");
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

  increment(stat) {
    var key = this.card();
    if (!(key in this.stats)) {
      this.stats[key] = {};
    }
    this.stats[key][stat] = (this.stats[key][stat] || 0) + 1;
  }

  discard() {
    this.log("discard");
    this.next();
    this.discards++;
  }

  next() {
    this.index = (this.index + 1) % this.deck.length;
    this.flipside = false;
  }

  flip() {
    this.log("flip");
    this.flipside = !this.flipside;
    this.flips++;
  }

  stop() {
    this.log("stop");
    this.log(this.discards + "d+" + this.flips + "f");
    this.next();
    this.discards = 0;
    this.flips = 0;
  }

  end() {
    this.log("end");
    this.deck = [];
    for (var i in this.stats) {
      this.messages.push([i, JSON.stringify(this.stats[i])].join(','));
    }
  }
  </script>

</arjuna>
