import { useState } from 'react'
import './styles.css'

function FilteredProductTable({ products }) {
  const [filterText, setFilterText] = useState('');
  const [onlyInStock, setOnlyInStock] = useState(false);

  return (
    <div className='body-table'>
      <SearchBar filterText={filterText} onlyInStock={onlyInStock} onFilterChange={setFilterText} onStockChange={setOnlyInStock} />
      <ProductTable products={products} filterText={filterText} onlyInStock={onlyInStock} />
    </div >
  )
}

function SearchBar({ filterText, onlyInStock, onFilterChange, onStockChange }) {

  return (
    <div className='header'>
      <input type="text" placeholder='Search...' value={filterText} onChange={(e) => onFilterChange(e.target.value)} />
      <label>
        <input type="checkbox" onChange={() => onStockChange(!onlyInStock)} />{' '}Only show products in stock
      </label>
    </div>
  )
}

function ProductTable({ products, filterText, onlyInStock }) {
  const rows = [];
  let lastCategory = null;

  products.forEach((product) => {
    if (product.name.toLowerCase().indexOf(filterText.toLowerCase()) === -1)
      return;
    if (!product.stocked && onlyInStock)
      return;

    if (product.category !== lastCategory)
      rows.push(
        <th>{product.category}</th>
      )
    rows.push(
      <ProductRow product={product} key={product.name} />
    )
    lastCategory = product.category;
  });

  return (
    <div>
      <div className="table-head">
        <th>Name</th>
        <th>Price</th>
      </div>
      <div className="table-body">{rows}</div>
    </div>
  )

}

function ProductRow({ product }) {
  const name = product.stocked ? product.name : <span style={{ color: "red" }}>{product.name}</span>

  return (
    <div className='product-row'>
      <div>
        {name}
      </div>
      <div>
        {product.price}
      </div>
    </div>
  )

}

const PRODUCTS = [
  { category: "Fruits", price: "$1", stocked: true, name: "Apple" },
  { category: "Fruits", price: "$1", stocked: true, name: "Dragonfruit" },
  { category: "Fruits", price: "$2", stocked: false, name: "Passionfruit" },
  { category: "Rock", price: "$2", stocked: true, name: "Large Rock" },
  { category: "Rock", price: "$9", stocked: false, name: "Sweet Rock " },
  { category: "Vegetables", price: "$2", stocked: true, name: "Spinach" },
  { category: "Vegetables", price: "$4", stocked: false, name: "Pumpkin" },
  { category: "Vegetables", price: "$1", stocked: true, name: "Peas" }
];

export default function App() {
  return <FilteredProductTable products={PRODUCTS} />
}