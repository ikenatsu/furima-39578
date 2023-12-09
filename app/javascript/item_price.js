function item_price() {
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = Math.floor( inputValue/10 )
    const addprofit = document.getElementById("profit")
    addprofit.innerHTML = Math.floor( inputValue - addTaxDom.innerHTML )
  })
};

window.addEventListener('turbo:load', item_price);
window.addEventListener('turbo:render', item_price);