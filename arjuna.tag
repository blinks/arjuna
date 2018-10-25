<arjuna>
  <table class="table">
    <tbody>
      <tr if={!active}>
        <td>
          <span class="badge {badge-secondary: flipped()}">?</span>
        </td>
        <td>
          <button type="button" class="btn btn-secondary"
            onclick={flip}>Flip</button>
          { current().flip }
        </td>
      </tr>
      <tr>
        <td>
          <span class="badge {badge-secondary: flipped()}">?</span>
        </td>
        <td>
          <button if={!active} type="button" class="btn btn-primary"
            onclick={exec}>Yes</button>
          <button if={!active} type="button" class="btn btn-secondary"
            onclick={next}>No</button>
          { current().exec }
        </td>
      </tr>
      <tr>
        <td><span class="badge badge-danger badge-pill">Raj</span></td>
        <td>
          <button if={active} type="button" class="btn btn-primary"
            onclick={next}>Done</button>
          { current().raj }
        </td>
      </tr>
      <tr>
        <td><span class="badge badge-warning badge-pill">INC</span></td>
        <td>
          <button if={active} type="button" class="btn btn-primary"
            onclick={next}>Done</button>
          { current().inc }
        </td>
      </tr>
      <tr>
        <td><span class="badge badge-success badge-pill">ML</span></td>
        <td>
          <button if={active} type="button" class="btn btn-primary"
            onclick={next}>Done</button>
          { current().ml }
        </td>
      </tr>
      <tr>
        <td><span class="badge badge-dark badge-pill">Rev</span></td>
        <td>
          <button if={active} type="button" class="btn btn-primary"
            onclick={next}>Done</button>
          { current().rev }
        </td>
      </tr>
    </tbody>
  </table>

  this.active = false;
  this.index = 0;
  this.deck = [
    { // A
      'front': {
        'flip': 'if Unity + Restraint is 2 to 4.',
        'exec': '6+ cubes in any spaces?',
        'raj': '[2] Sweep with Treaty: (1) To Control all Cities and Provinces with Congress Activists.',
        'inc': 'Rally with Satyagraha: (1) In 2 spaces with most cubes.',
        'ml':  'Rally with Negotiate: (1) In 1 Muslim space with most cubes.',
        'rev': '[3] Rally with Infiltrate: (1) In all 2 Pop spaces without Unrest.'
      },
      // AA
      'back': {
        'flip': 'if Unity + Restraint is 5 to 10.',
        'exec': '6+ cubes in any spaces?',
        'raj': '[1] Sweep with Govern: (1) To Activate all Guerrillas at Support.',
        'inc': 'Civil Disobedience with Negotiate: (1) In 1 space with the most cubes.',
        'ml':  'Civil Disobedience with Negotiate: (1) In 1 space with the most cubes.',
        'rev': '[1] Aid then March: (1) Get 1 Underground Guerrilla to each Support space.'
      },
      'flipped': false
    },
    { // B
      'front': {
        'flip': 'if Activists in 4+ Protest spaces.',
        'exec': 'Any Protest Provinces with no Raj Control?',
        'raj': '[3] Sweep with Govern: (1) To Control 2 Protest spaces with most adversaries.',
        'inc': 'Non-Cooperation with Persuade: (1) To add Opposition in 1 non-Muslim space.',
        'ml':  'Non-Cooperation with Persuade: (1) In 2 Muslim spaces with fewest cubes.',
        'rev': '[U] March with Infiltrate: (1) Get 1 Guerrilla to 2 States without Unrest.'
      },
      // BB
      'back': {
        'flip': 'if 0 to 3 total Protest markers in India.',
        'exec': 'Any Protest Provinces with no Raj Control?',
        'raj': '[R] Martial Law then Assault: (1) To remove most adversaries in Protest spaces.',
        'inc': 'Non-Cooperation with Satyagraha: (1) At non-Muslim Support.',
        'ml':  'Non-Cooperation with Infiltrate: (1) In Muslim 2 Pop spaces.',
        'rev': '[2] Infiltrate then Attack: (1) In spaces with 2+ Guerrillas.'
      },
      'flipped': false
    },
  ];

  flipped() {
    return this.deck[this.index].flipped;
  }

  current() {
    card = this.deck[this.index]
    return card.flipped ? card.back : card.front;
  }

  flip(e) {
    console.log('flip');
    this.deck[this.index].flipped = !this.deck[this.index].flipped;
  }

  exec(e) {
    console.log('exec');
    this.active = true
  }

  next(e) {
    console.log('next');
    this.active = false;
    this.index = (this.index + 1) % this.deck.length;
  }

</arjuna>
