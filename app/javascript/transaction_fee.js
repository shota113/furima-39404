window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  const profitInput = document.getElementById("profit");
  addTaxDom.innerHTML = Math.floor(inputValue*0.1);
  profitInput.innerHTML = inputValue - addTaxDom.innerHTML;
  });
});