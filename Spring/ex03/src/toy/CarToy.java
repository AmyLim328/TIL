package toy;

import battery.Battery;
import battery.NormalBattery;

// 1번
// 배터리 일체형 자동차
// 배터리가 떨어지면 장난감을 새로 구입해야 함 (비효율적 ..ㅠㅠ)
public class CarToy {
	private Battery battery;
	
	// CarToy 객체 안에서 Battery 객체 생성
	// 내부에서 알아서 생성해서 주입!
	// DI 방법이 아님!
	public CarToy() {
		battery = new NormalBattery();
	}
}
