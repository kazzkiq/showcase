<comp-cards>
  <div class="CardsComp">
    <div class="container">
      <div class="cards-list">
        <div class="card" each="{ cards }">
          <div class="image">
            <img if="{ imageUrl }" src="{ imageUrl }" alt="{ name }">
          </div>
          <div class="title">{ name }</div>
          <div class="description">{ description }</div>
          <hr>
          <div class="action-buttons">
            <div class="btn">
              Visit Project
            </div>
            <div class="btn outline" onclick="{ actionDetails }">
              See Details
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
    this.cards = [];

    this.on('mount', () => {
      this.fetchCardsData();
    });

    createCardObj () {
      return {
        name: null,
        description: null,
        descriptionFull: null,
        imageUrl: null,
      }
    }

    /*
     * Modify your JSON AJAX URL and object here
     */
    fetchCardsData () {
      const API_PATH = '/sample.json';
      ajax().get(API_PATH).then((res, xhr) => {
        
        res.forEach((current) => {
          let card = this.createCardObj();

          // This is where you bind your objects fetched from JSON
          card.name = current.name;
          card.description = current.description;
          card.descriptionFull = current.descriptionFull;
          card.imageUrl = current.imageUrl;

          this.cards.push(card);
        });

        this.update();
      });
    }

    /*
     * Modify your details action here
     */
    actionDetails (e) {
      const item = e.item;
      
      let comp = document.createElement('COMP-SIDEBAR');
      document.body.append(comp);
      riot.mount(comp, item);
    }
  </script>
</comp-cards>