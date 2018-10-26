<arjuna>
  <h2 if={!player}>Arjuna: Choose Your Faction</h2>
  <div if={!player} class="list-group">
    <a each={ faction in factions }
      href="#" class="list-group-item" onclick={start}>
      {faction.toUpperCase()}
    </a>
  </div>

  <table if={player} class="table">
    <tbody>
      <tr>
        <td colspan='3'>
          <center>
          {player.toUpperCase()} :
          { deck[index].id }{ flipped() ? deck[index].id : '' }
          </center>
        </td>
      </tr>
      <tr>
        <td width="30%">
          <button if={!active} type="button" class="btn btn-secondary"
            onclick={flip}>Flip</button>
        </td>
        <td width="20%">
          <span class="badge {badge-secondary: flipped()}">Flip?</span>
        </td>
        <td width="50%">
          { current().flip }
        </td>
      </tr>
      <tr>
        <td>
          <div if={!active} class="btn-group" role="group" aria-label="Execute?">
            <button type="button" class="btn btn-primary" onclick={exec}>Yes</button>
            <button type="button" class="btn btn-secondary" onclick={next}>No</button>
          </div>
        </td>
        <td>
          <span class="badge {badge-secondary: flipped()}">Exec?</span>
        </td>
        <td>
          { current().exec }
        </td>
      </tr>
      <tr each={ faction in factions } key={faction}>
        <td>
          <button if={active && faction != player} type="button" class="btn btn-primary"
            onclick={next}>Done</button>
        </td>
        <td>
          <span class="badge badge-pill">{faction.toUpperCase()}</span>
          { current()[faction].limit }
        </td>
        <td>
          <b>{ current()[faction].action }</b>
          <p>&#9312; { current()[faction].mods }</p>
        </td>
      </tr>
    </tbody>
  </table>

  <footer class="m-2">(Arjuna is for solo mode testing only.)</footer>

  this.player = undefined;
  this.active = false;
  this.index = 0;
  this.factions = ['raj','inc','ml','rev'];
  this.deck = [
  {
    "front": {
      "rev": {
        "action": "Rally with Infiltrate:", 
        "mods": "In all 2 Pop spaces without Unrest", 
        "limit": "V3"
      }, 
      "exec": "6+ cubes in any spaces?", 
      "ml": {
        "action": "Rally with Negotiate:", 
        "mods": "In 1 Muslim space with most cubes"
      }, 
      "raj": {
        "action": "Sweep with Treaty:", 
        "mods": "To Control all Cities and Provinces with Congress Activists", 
        "limit": "R2"
      }, 
      "flip": "Flip if Unity + Restraint is 2 to 4.", 
      "inc": {
        "action": "Rallly with Satyagraha:", 
        "mods": "In 2 spaces with most cubes"
      }
    }, 
    "flipped": false, 
    "id": "A", 
    "back": {
      "rev": {
        "action": "Aid then March:", 
        "mods": "Get 1 Underground Guerrilla to each Support space", 
        "limit": "V1"
      }, 
      "exec": "6+ cubes in any spaces?", 
      "ml": {
        "action": "Civil Disobedience with Negotiate:", 
        "mods": "In 1 space with the most cubes"
      }, 
      "raj": {
        "action": "Sweep with Govern:", 
        "mods": "To Activate all Guerrillas at Support", 
        "limit": "R1"
      }, 
      "flip": "Flip if Unity + Restraint is 5 to 10.", 
      "inc": {
        "action": "Civil Disobedience with Negotiate:", 
        "mods": "In 1 space with the most cubes"
      }
    }
  }, 
  {
    "front": {
      "rev": {
        "action": "Unrest with Infiltrate:", 
        "mods": "In States", 
        "limit": "VR"
      }, 
      "exec": "Activists or Guerrillas in any States?", 
      "ml": {
        "action": "Rally with Negotiate:", 
        "mods": "In 3 Muslim spaces without NV"
      }, 
      "raj": {
        "action": "Deploy with Treaty:", 
        "mods": "In 1 City adjacent to most Active adversaries", 
        "limit": "R3"
      }, 
      "flip": "Flip if there are any Muslim States in India.", 
      "inc": {
        "action": "Rally with Negotiate:", 
        "mods": "In 2 States with highest Pop"
      }
    }, 
    "flipped": false, 
    "id": "C", 
    "back": {
      "rev": {
        "action": "Unrest with Assassinate:", 
        "mods": "In States", 
        "limit": "VR"
      }, 
      "exec": "Activists or Guerrillas in any States?", 
      "ml": {
        "action": "Non-Cooperation with Infiltrate:", 
        "mods": "In Muslim States"
      }, 
      "raj": {
        "action": "Assault with Treaty:", 
        "mods": "To remove all adversaries from 2 Provinces", 
        "limit": "RU"
      }, 
      "flip": "Flip if there are no Muslim States in India.", 
      "inc": {
        "action": "Non-Cooperation with Negotiate:", 
        "mods": "In 2 States with highest Pop"
      }
    }
  }, 
  {
    "front": {
      "rev": {
        "action": "March with Infiltrate:", 
        "mods": "Get 1 Guerrilla to 2 States without Unrest", 
        "limit": "VU"
      }, 
      "exec": "Any Protest Provinces with no Raj Control?", 
      "ml": {
        "action": "Non-Cooperation with Persuade:", 
        "mods": "In 2 Muslim spaces with fewest cubes"
      }, 
      "raj": {
        "action": "Sweep with Govern:", 
        "mods": "To Control 2 Protest spaces with most adversaries", 
        "limit": "R3"
      }, 
      "flip": "Flip if Activists in 4+ Protest spaces.", 
      "inc": {
        "action": "Non-Cooperation with Persuade:", 
        "mods": "To add Opposition in 1 non-Muslim space"
      }
    }, 
    "flipped": false, 
    "id": "B", 
    "back": {
      "rev": {
        "action": "Infiltrate then Attack:", 
        "mods": "In spaces with 2+ Guerrillas", 
        "limit": "V2"
      }, 
      "exec": "Any Protest Provinces with no Raj Control?", 
      "ml": {
        "action": "Non-Cooperation with Infiltrate:", 
        "mods": "In Muslim 2 Pop spaces"
      }, 
      "raj": {
        "action": "Martial Law then Assault:", 
        "mods": "To remove most adversaries in Protest spaces", 
        "limit": "RR"
      }, 
      "flip": "Flip if 0 to 3 total Protest markers in India.", 
      "inc": {
        "action": "Non-Cooperation with Satyagraha:", 
        "mods": "At non-Muslim Support"
      }
    }
  }, 
  {
    "front": {
      "rev": {
        "action": "March with Infiltrate:", 
        "mods": "Get 1 Underground Guerrilla to each 2 Pop Support space", 
        "limit": "V3"
      }, 
      "exec": "Any 2-Pop Provinces with no Raj Control?", 
      "ml": {
        "action": "Non-Cooperation with Infiltrate:", 
        "mods": "In Muslim 2 Pop spaces"
      }, 
      "raj": {
        "action": "Sweep with Govern:", 
        "mods": "To Control all 2 Pop spaces", 
        "limit": "R2"
      }, 
      "flip": "Flip if Protest in any 2-Pop spaces.", 
      "inc": {
        "action": "Civil Disobedience with Persuade:", 
        "mods": "In all 2-Pop spaces not at Active Opposition"
      }
    }, 
    "flipped": false, 
    "id": "E", 
    "back": {
      "rev": {
        "action": "Aid then Unrest:", 
        "mods": "To reduce most Muslim Opposition", 
        "limit": "V3"
      }, 
      "exec": "Any 2-Pop Provinces with no Raj Control?", 
      "ml": {
        "action": "Non-Cooperation with Infiltrate:", 
        "mods": "To add most Muslim Opposition"
      }, 
      "raj": {
        "action": "Martial Law then Sweep:", 
        "mods": "To Control all 2 Pop spaces", 
        "limit": "RR"
      }, 
      "flip": "Flip if no Protest in any 2-Pop spaces.", 
      "inc": {
        "action": "Non-Cooperation with Persuade:", 
        "mods": "To add most non-Muslim Opposition"
      }
    }
  }, 
  {
    "front": {
      "rev": {
        "action": "Aid then Rally:", 
        "mods": "In 2 States without Guerrillas", 
        "limit": "V3"
      }, 
      "exec": "Raj Controls 3+ spaces with Active adversaries?", 
      "ml": {
        "action": "Civil Disobedience with Persuade:", 
        "mods": "In 1 Muslim space with the most cubes"
      }, 
      "raj": {
        "action": "Assault with Govern:", 
        "mods": "To remove all Active adversaries in Neutral or Opposition spaces", 
        "limit": "RR"
      }, 
      "flip": "Flip if Restaint is 1 or 2.", 
      "inc": {
        "action": "Demonstrate with Satyagraha:", 
        "mods": "To the 2 Pop space with most cubes"
      }
    }, 
    "flipped": false, 
    "id": "D", 
    "back": {
      "rev": {
        "action": "Rally with Infiltrate:", 
        "mods": "In 2 Pop spaces without Unrest", 
        "limit": "VU"
      }, 
      "exec": "Raj Controls 3+ spaces with Active adversaries?", 
      "ml": {
        "action": "Rally with Persuade:", 
        "mods": "To get Activists to exceed Congress in 1 non-Muslim space"
      }, 
      "raj": {
        "action": "Assault with Govern:", 
        "mods": "To allow Imperialism in 1 Neutral or Opposition space", 
        "limit": "RR"
      }, 
      "flip": "Flip if Restaint is 3 to 5.", 
      "inc": {
        "action": "Rally with Negotiate:", 
        "mods": "Get Activists to exceed Muslim League in 1 Muslim space"
      }
    }
  }, 
  {
    "front": {
      "rev": {
        "action": "Aid then Unrest:", 
        "mods": "In 1 space with most Guerrillas and no Unrest", 
        "limit": "V4"
      }, 
      "exec": "Underground Guerrillas in Support or Opposition spaces?", 
      "ml": {
        "action": "Demonstrate with Persuade:", 
        "mods": "To 2 Muslim spaces without NV"
      }, 
      "raj": {
        "action": "Sweep with Treaty:", 
        "mods": "To Activate all Guerrillas in 2 Support spaces", 
        "limit": "RR"
      }, 
      "flip": "Flip if Guerrillas exceed cubes + Activists in any space.", 
      "inc": {
        "action": "Demonstrate with Persuade:", 
        "mods": "To 2 States without NV"
      }
    }, 
    "flipped": false, 
    "id": "G", 
    "back": {
      "rev": {
        "action": "Unrest with Assassinate:", 
        "mods": "In 1 Support space then in 1 Opposition space", 
        "limit": "V3"
      }, 
      "exec": "Underground Guerrillas in Support or Opposition spaces?", 
      "ml": {
        "action": "Demonstrate with Negotiate:", 
        "mods": "To get Activists to at least equal Guerrillas in 2 Muslim spaces"
      }, 
      "raj": {
        "action": "Sweep with Govern:", 
        "mods": "To Activate most Underground Guerrillas in 3 Support spaces", 
        "limit": "R2"
      }, 
      "flip": "Flip if cubes + Activists exceed Guerrillas in all spaces.", 
      "inc": {
        "action": "Civil Disobedience with Negotiate:", 
        "mods": "In 2 spaces with most Guerrillas"
      }
    }
  }, 
  {
    "front": {
      "rev": {
        "action": "Aid then Rally:", 
        "mods": "In 1 Protest space", 
        "limit": "V3"
      }, 
      "exec": "Any Protest spaces without Activists?", 
      "ml": {
        "action": "Rally with Negotiate:", 
        "mods": "To 1 Muslim space with the most cubes"
      }, 
      "raj": {
        "action": "Sweep with Govern:", 
        "mods": "To Control all Protest Cities and Provinces", 
        "limit": "R3"
      }, 
      "flip": "Flip if Unity is 1 or 2.", 
      "inc": {
        "action": "Rally with Persuade:", 
        "mods": "In 2 spaces to reduce most Support"
      }
    }, 
    "flipped": false, 
    "id": "F", 
    "back": {
      "rev": {
        "action": "Infiltrate then Attack:", 
        "mods": "In Protest spaces with 2+ Guerrillas", 
        "limit": "V2"
      }, 
      "exec": "Any Protest spaces without Activists?", 
      "ml": {
        "action": "Rally with Negotiate:", 
        "mods": "In 2 Muslim spaces at most Support"
      }, 
      "raj": {
        "action": "Sweep with Govern:", 
        "mods": "To exceed adversaries in all Protest spaces", 
        "limit": "R1"
      }, 
      "flip": "Flip if Unity is 3 to 5.", 
      "inc": {
        "action": "Demonstrate with Satyagraha:", 
        "mods": "To 1 space with most cubes"
      }
    }
  }, 
  {
    "front": {
      "rev": {
        "action": "Attack with Infiltrate:", 
        "mods": "In 1 space with most Guerrillas", 
        "limit": "VU"
      }, 
      "exec": "Any Protest markers are available?", 
      "ml": {
        "action": "Civil Disobedience with Infiltrate:", 
        "mods": "In spaces without cubes"
      }, 
      "raj": {
        "action": "Deploy with Govern:", 
        "mods": "In 1 City with the most adversaries", 
        "limit": "R3"
      }, 
      "flip": "Flip if 3+ Protest markers are available.", 
      "inc": {
        "action": "Civil Disobedience with Satyagraha:", 
        "mods": "In 1 City with most cubes"
      }
    }, 
    "flipped": false, 
    "id": "H", 
    "back": {
      "rev": {
        "action": "Infiltrate then Attack:", 
        "mods": "In 1 space with most Guerrillas and no Base.", 
        "limit": "V2"
      }, 
      "exec": "Any Protest markers are available?", 
      "ml": {
        "action": "Civil Disobedience with Negotiate:", 
        "mods": "In Muslim spaces"
      }, 
      "raj": {
        "action": "Martial Law then Assault:", 
        "mods": "To arrest Gandhi and most NV in 2 spaces", 
        "limit": "RR"
      }, 
      "flip": "Flip if 0 to 2 Protest markers are available.", 
      "inc": {
        "action": "Civil Disobedience with Satyagraha:", 
        "mods": "In 2 spaces with most adversaries"
      }
    }
  }, 
  {
    "front": {
      "rev": {
        "action": "Aid then Unrest", 
        "mods": "On 1 Railway at highest Econ", 
        "limit": "V5"
      }, 
      "exec": "Any Activists or Guerrillas on Railways?", 
      "ml": {
        "action": "Civil Disobedience with Negotiate:", 
        "mods": "On 1 Railway at highest Econ"
      }, 
      "raj": {
        "action": "", 
        "mods": "", 
        "limit": ""
      }, 
      "flip": "Flip if Activists or Guerrillas are on any Railways without cubes.", 
      "inc": {
        "action": "Civil Disobedience with Persuade:", 
        "mods": "Place Protest on 1 Railway with highest Econ"
      }
    }, 
    "flipped": false, 
    "id": "J", 
    "back": {
      "rev": {
        "action": "Aid then Unrest:", 
        "mods": "On Railways", 
        "limit": "V4"
      }, 
      "exec": "Any Activists or Guerrillas on Railways?", 
      "ml": {
        "action": "Civil Disobedience with Negotiate:", 
        "mods": "To get Activsts on all 5-Econ Railways"
      }, 
      "raj": {
        "action": "", 
        "mods": "", 
        "limit": ""
      }, 
      "flip": "Flip if cubes at least equal Activists + Guerrillas on all Railways.", 
      "inc": {
        "action": "Civil Disobedience with Negotiate:", 
        "mods": "To get Activists on all 5-Econ Railways"
      }
    }
  }
];

  log(msg) {
    var card = this.deck[this.index];
    var id = card.id;
    if (card.flipped) { id += id; }
    console.log(id + ": " + msg);
  }

  start(e) {
    this.player = e.item.faction;
    console.log("Start: " + this.player);
  }

  flipped() {
    return this.deck[this.index].flipped;
  }

  current() {
    var card = this.deck[this.index];
    return card.flipped ? card.back : card.front;
  }

  flip(e) {
    var card = this.deck[this.index];
    this.log("Flipped.");
    card.flipped = !card.flipped;
  }

  exec(e) {
    var card = this.deck[this.index];
    this.log("Condition true.");
    this.active = true;
  }

  next(e) {
    if (e.item) {
      this.log("Acted for " + e.item.faction);
    } else {
      this.log("Condition false.");
    }
    this.active = false;
    this.index = (this.index + 1) % this.deck.length;
  }

</arjuna>
