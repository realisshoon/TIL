const items = [
    { name: '사이다', price: '500' },
    { name: '콜라', price: '1000' },
    { name: '비타민음료', price: '300' },
  ];
  
  const moneyList = [100, 500, 1000];
  //초기화
  let currentMoney = 0; 
  
  const init = () => {
    addItemToShelf();
    addMoneyToPopup();
    addmoney();
    document.querySelector('#insert-money').addEventListener('click', onClickInsert);
    document.querySelector('#result-base>.panel').addEventListener('click', hideAllPopup);
  
    render();
  }
  
  const render = () => {
    document.querySelector('#current-money').innerHTML = currentMoney.toString();
  };
  
  const addItemToShelf = () => {
    const shelfElement = document.querySelector('#shelf');
  
    items.forEach((item, index) => {
      const itemElement = createElement(`${item.name}<br>${item.price}`, index, onClickItem);
  
      shelfElement.appendChild(itemElement);
    });
  };

  const addmoney = () => {
    const shelfElement = document.querySelector('#insert-money');
  
    items.forEach((index) => {
      const itemElement = createElement(`${moneyList[index]}`, index, onClickItem);
  
      shelfElement.appendChild(itemElement);
    });
  };
  
  const addMoneyToPopup = () => {
    const baseElement = document.querySelector('#money-base>.panel');
  
    moneyList.forEach((item, index) => {
      const itemElement = createElement(item, index, onClickMoney);
  
      baseElement.appendChild(itemElement);
    });
  };
  
  const createElement = (name, index, callback) => {
    const element = document.createElement('div');
  
    element.innerHTML = name;
    element.classList.add('button');
    element.setAttribute('data-index', index);
    element.addEventListener('click', callback);
  
    return element;
  };
  
  const showResultPopup = (text) => {
    const resultBaseElement = document.querySelector('#result-base');
    const resultPanelElement = document.querySelector('#result-base>.panel');
  
    resultPanelElement.innerHTML = text;
    showElement(resultBaseElement);
  };
  
  const hideAllPopup = () => document.querySelectorAll('.popup').forEach((element) => hideElement(element));
  
  const showElement = (element) => element.classList.remove('hide');
  
  const hideElement = (element) => element.classList.add('hide');
  
  const onClickItem = (event) => {
    const targetElement = event.target;
    const itemIndex = targetElement.getAttribute('data-index');
    const item = items[itemIndex];
  
    if (item.price <= currentMoney) {
      currentMoney -= item.price;
  
      showResultPopup(`${item.name}을(를) 획득했다!`);
      render();
    } else {
      showResultPopup(`돈이 부족하다!`);
    }
  };
  
  const onClickInsert = (event) => {
    hideAllPopup();
  
    showElement(document.querySelector('#money-base'));
  };
  
  const onClickMoney = (event) => {
    const targetElement = event.target;
    const itemIndex = targetElement.getAttribute('data-index');
    const item = moneyList[itemIndex];
  
    currentMoney += item;
  
    render();
  
    hideElement(document.querySelector('#money-base'));
  };
  
  init();