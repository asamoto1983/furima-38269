window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const commission = Math.floor(inputValue/ 10);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = commission
    const SalesProfit = document.getElementById("profit");
    SalesProfit.innerHTML = Math.floor(inputValue - commission);
  });
});




