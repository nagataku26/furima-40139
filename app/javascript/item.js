function item(){
  const priceInput = document.getElementById("item-price");
  const taxAmountElement = document.getElementById("add-tax-price");
  const profitElement = document.getElementById("profit");

  priceInput.addEventListener("input",() =>{
    const inputValue = priceInput.value;

    taxAmountElement.innerHTML = Math.floor(inputValue * 0.1);

    profitElement.innerHTML = Math.floor(inputValue * 0.9);

  });





};

window.addEventListener('turbo:load', item);