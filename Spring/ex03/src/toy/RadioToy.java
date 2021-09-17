package toy;

import battery.Battery;

// 3번
// 배터리 분리형 라디오 장난감
// 장난감을 사면 배터리를 기본으로 넣어줌
// => 가장 좋은 방법!
public class RadioToy {
	private Battery battery;
	
	// 의존 주입을 생성자를 통해 함
	public RadioToy(Battery battery) {
		this.battery = battery;
	}
	
	// 의존 주입을 setter를 통해 함
	public void setBattery(Battery battery) {
		this.battery = battery;
	}
}
