<comp-search>
  <div class="SearchComp">
    <input type="text" placeholder="Search..." oninput="{ filter }">
  </div>

  <script>
    this.cards = this.parent.cards;
    
    filter (e) {
      let input = e.target
      let value = input.value;
      let filteredCards;

      if(value.length < 1) {
        console.log('oe')
        this.parent.displayCards = this.parent.cards.slice(0, 16);
        this.parent.update();
        this.parent.isFilterActive = false;
        return;
      }
      
      console.log(this.cards, 1);

      filteredCards = this.cards.filter((card) => {
        card.tags = card.tags || []

        if ((card.name + card.tags.join('')).toLowerCase().indexOf(value.toLowerCase()) > -1) {
          return true;
        } else {
          return false;
        }
      });
      
      this.parent.isFilterActive = true;
      this.parent.displayCards = filteredCards;
      this.parent.update();
      
    }
  </script>
</comp-search>