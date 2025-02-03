1. Initialize deck
2. Deal cards to Player and Dealer
3. Player turn: hit or stay
   - Repeat until bust or stay
   - If Player busts, Dealer wins
4. Dealer turn: hit or stay
   - Hit until Dealer's total >= 17
   - If Dealer busts, Player wins
5. Compare totals and declare winner or tie


Data structures
  - Deck
    - An array of strings
      - `'c2'` is clubs 2
      - `'dj'` is diamonds Jack
      - `'ha'` is hearts Ace
      - `'sk'` is spades King
  - Player/Dealer's cards
    - An array of strings