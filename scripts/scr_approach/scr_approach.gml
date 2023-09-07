//função de aproximação, faz com que a aceleração do personagem fique mais suave do que quando usamos a função lerp
function approach(val1, val2, amount){
	if(val1 < val2){
		val1 += amount;
		if(val1 > val2)
			return val2;
	}else{
		val1 -= amount;
		if(val1 < val2)
			return val2;
	}
	return val1;
}