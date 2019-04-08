package model;

import java.util.HashMap;
import java.util.Map.Entry;

public class Cart {
	private HashMap<Integer,Item> cartItems;
	
	public Cart() {
		// TODO Auto-generated constructor stub
		cartItems = new HashMap<>();
	}

	public Cart(HashMap<Integer, Item> cartItems) {
		super();
		this.cartItems = cartItems;
	}

	public HashMap<Integer, Item> getCartItems() {
		return cartItems;
	}

	public void setCartItems(HashMap<Integer, Item> cartItems) {
		this.cartItems = cartItems;
	}
	
	public void insertToCart(Integer key, Item item) {
		 boolean check = cartItems.containsKey(key);
	        if (check) {
	            int quantity_old = item.getQuantity();
	            item.setQuantity(quantity_old + 1);
	            cartItems.put(key, item);
	        } else {
	            cartItems.put(key, item);
	        }
	}
	
	public void removeCart(Integer key){
		boolean check = cartItems.containsKey(key);
		if(check)
		{
			cartItems.remove(key);
		}
	}	
	
	public int countItem() {
		return cartItems.size();
	}
	
	public double total() {
        int count = 0;
        for (Entry<Integer, Item> list : cartItems.entrySet()) {
            count += list.getValue().getProduct().getPrice() * list.getValue().getQuantity();
        }
        return count;
}

}
