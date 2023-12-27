function item(){
  const priceInput = document.getElementById("item-price");
  const taxAmountElement = document.getElementById("add-tax-price");
  const profitElement = document.getElementById("profit");

  priceInput.addEventListener("input",() =>{
    const inputValue = parseFloat(priceInput.value);

    if (isNaN(inputValue)) {
      taxAmountElement.innerHTML = "";
      profitElement.innerHTML = "";
      return;
    }

    const taxAmount = Math.floor(inputValue * 0.1);
    taxAmountElement.innerHTML = taxAmount;

    const profitAmount = Math.floor(inputValue - taxAmount);
    profitElement.innerHTML = profitAmount;

  });





};

window.addEventListener('turbo:load', item);
window.addEventListener("turbo:render", item);