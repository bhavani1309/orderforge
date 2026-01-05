import React, { useState } from "react";
import axios from "axios";

function App() {
  const [productName, setProductName] = useState("");
  const [quantity, setQuantity] = useState(1);
  const [price, setPrice] = useState(0);
  const [message, setMessage] = useState("");
  const [orders, setOrders] = useState([]);

  const createOrder = async () => {
    try {
      const response = await axios.post("http://localhost:8090/orders", {
        userId: 1,
        items: [
          {
            productName: productName,
            quantity: quantity,
            price: price
          }
        ]
      });
      setMessage("Order created with ID: " + response.data);
    } catch (err) {
      setMessage("Error creating order");
    }
  };

  const loadOrders = async () => {
    try {
      const response = await axios.get("http://localhost:8090/orders");
      setOrders(response.data);
    } catch (err) {
      console.error("Error loading orders");
    }
  };

  return (
    <div style={{ padding: "30px" }}>
      <h2>OrderForge – Create Order</h2>

      <input
        placeholder="Product name"
        value={productName}
        onChange={(e) => setProductName(e.target.value)}
      />
      <br /><br />

      <input
        type="number"
        placeholder="Quantity"
        value={quantity}
        onChange={(e) => setQuantity(Number(e.target.value))}
      />
      <br /><br />

      <input
        type="number"
        placeholder="Price"
        value={price}
        onChange={(e) => setPrice(Number(e.target.value))}
      />
      <br /><br />

      <button onClick={createOrder}>Create Order</button>

      <p>{message}</p>

      <hr />

      <button onClick={loadOrders}>Load Orders</button>

      <h3>Orders</h3>

      <ul>
        {orders.map((order) => (
          <li key={order.id}>
            Order #{order.id} | Status: {order.status} | Total: {order.totalAmount}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;
