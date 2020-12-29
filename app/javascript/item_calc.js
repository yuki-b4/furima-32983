window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener('input', () => {
    const inputPrice = priceInput.value
    const addTaxSum = document.getElementById('add-tax-price')
    addTaxSum.innerHTML = Math.floor(inputPrice*0.1)
    const sellBenefit = document.getElementById('profit')
    sellBenefit.innerHTML = Math.floor(inputPrice*0.9)
  })
  
})