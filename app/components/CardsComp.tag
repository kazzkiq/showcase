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
            <div class="btn outline">
              Do something
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
    this.cards = [
      {
        name: 'Project 1',
        description: 'This is a project talking about some cool stuff, like in koolaid.',
        imageUrl: ''
      },
      {
        name: 'Project 2',
        description: 'This is a project talking about some cool stuff, like in koolaid.',
        imageUrl: ''
      },
      {
        name: 'Project 3',
        description: 'This is a project talking about some cool stuff, like in koolaid.',
        imageUrl: ''
      },
      {
        name: 'Project 4',
        description: 'This is a project talking about some cool stuff, like in koolaid.',
        imageUrl: ''
      },
      {
        name: 'Project 5',
        description: 'This is a project talking about some cool stuff, like in koolaid.',
        imageUrl: ''
      },
      {
        name: 'Project 6',
        description: 'This is a project talking about some cool stuff, like in koolaid.',
        imageUrl: ''
      },
      {
        name: 'Project 7',
        description: 'This is a project talking about some cool stuff, like in koolaid.',
        imageUrl: ''
      },
      {
        name: 'Project 8',
        description: 'This is a project talking about some cool stuff, like in koolaid.',
        imageUrl: ''
      }
    ]
  </script>
</comp-cards>