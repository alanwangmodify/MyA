//
//  ModelSwift.swift
//  Frame
//
//  Created by choumei_mac on 15/1/15.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

import UIKit

class ModelSwift: NSObject {
 
	var nameTest:NSString!
	
//	一个构造函数来初始化类实例。使用 init 来 创建一个构造器。
	
//	init(name: String) {
//		super.init()
//		 self.nameTest = name
//		
// }
//	如果你需要在删除对象之前进行一些清理工作,使用 deinit 创建一个析构函数。
	
	func mainTest(_nume :NSString) {
		
//=====================简单值======================
		
		//使用 let 来声明常量,使用 var 来声明变量
		var myVariabel = 44
		myVariabel  = 45
		let myCon = 50
		println("switStudy====================================")
		println("test")
		
		//在上面的例子中,编译器推断出 myVariable 是一个整 数(integer)因为它的初始值是整数。
		//	如果初始值没有提供足够的信息(或者没有初始值),那你需要在变量后面声明类型,用冒 号分割。
		let implicIn = 70
		let implicDoble = 70.0
		let exttDoubel  = 99.000000
		var implicDobuletVar : Float = 44
		println("exttDoubel \(exttDoubel)")
		println(implicDobuletVar)
		
		
		//值永远不会被隐式转换为其他类型。如果你需要把一个值转换成其他类型,请显式转换
		
		let label = "testLabe"
		let wideth = 94
		let widtlabe = label + String(wideth)
		println(widtlabe)
		
		//有一种更简单的把值转换成字符串的方法:把值写到括号中,并且在括号之前写一个反斜杠
		let fruitSummary = "I have \(implicIn  + myVariabel) piec es of frui t."
		
		
		//使用方括号[]来创建数组和字典,并使用下标或者键(key)来访问元素。
		
		var shoppingList = [" catfi sh", "wate r", " tulip s", " blue paint "]
		println(shoppingList[1])
		shoppingList[1]  = "alal"
		println(shoppingList[1])
		
		var diction = ["key1":"alan"]
		
		diction["key2"] = "alan2" //可以这样 添加一个
		
		let test = diction["key1"]
		println(test)
		println(diction["key2"])
		
		
		//要创建一个空数组或者字典,使用初始化语法。
		//???????????
//		let emptyArr = String()
//		let emptyDic = Dictionary<String,Float>()
		
		
//		如果类型信息可以被推断出来,你可以用[]和[:]来创建空数组和空字典——就像你声明变 量
//		或者给函数传参数的时候一样。
		let emptyArr = []
		let emptyDic = [:]
		
		
		
//=====================控制流======================		
		
//		使用 if 和 switch 来进行条件操作,使用 for-in、for、while 和 do-while 来进行循环。包裹条
//		件和循环变量括号可以省略,但是语句体的大括号是必须的。
		
		let arr = [1,2,3,4,5]
		var tam = 10
		for num in arr {
			println(num)
		}
//		在 if 语句中,条件必须是一个布尔表达式——像 if score { ... }这样的代码是错误的。
		
		
//		可以一起使用 if 和 let 来处理值缺失的情况。有些变量的值是可选的。一个可选的值可能 是一个具体的值或者是 nil,表示值缺失。在类型后面加一个问号？来标记这个变量的值是可选的。
		
		//????????????
		var optionalString: String? = "Hello"
		optionalString == "second hello"
		//???????????????有什么用
		
		
		var optionName :String?  = "alan"
		optionName == "nil"
		var greeting = "Hellow"
		
		if let name = optionName {
			println(optionName)
		} else {
			println(optionalString)
		}
		
		var aa  = "ddd"
		//switch 支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等。
		switch aa  {   //！！！这里的aa不能是可选的
		case "ddd":
			println("hello")
		case let x where x.hasSuffix("d"):   //!!!!!!!!!!!!!!!!!!
			println("hassuffix")
		default :
			println("default")
		}
		//运行 switch 中匹配到的子句之后,程序会退出 switch 语句,并不会继续向下运行,所以不 需要在每个子句结尾写 break
		
		
		let dicArr = [
			"num":[1,2,3],
			"to":[5,6,7],
		]
		
		for (key,Arr) in dicArr { //
			for num in Arr {
			println(num)
			}
		}//打印顺序是 567 123
		
		
		
//		可以在循环中使用..<来表示范围,也可以使用传统的写法,两者是等价的:
//		使用..<创建的范围不包含上界,如果想包含的话需要使用...
		
		for i in 0 ..< 4{
			println(i)
		}
		for i in 0 ... 4 {
			println(i)
		}
		
//=====================函数和闭包======================
		
		
		
		//SWIFT
		//	class func dateFormatFromTemplate(_ template: String,options opts: Int,locale locale: NSLocale?) -> String?
		//	//OBJECTIVE-C
		//	+ (NSString *)dateFormatFromTemplate:(NSString *)template options:(NSUInteger)opts locale:(NSLocale *)locale
		
//		使用 func 来声明一个函数,使用名字和参数来调用函数。使用->来指定函数返回值。
		func testFunc (name :String ,  day:String) -> String{
			return "hello\(name),todya is \(day)"
		}
		
		var testFuncStr :String
		testFuncStr = testFunc("alan", "today")    //函数调用
		println(testFunc("alan","2015"))

		
//		使用一个元组来返回多个值。
		func getGasPrices() -> (String, Double, Double) {
			return ("alan",1,2)
		} //如何取这些值？？？？？？？？？？？？？
		println(getGasPrices())
		
		
//		函数的参数数量是可变的,用一个数组来获取它们
		
		func sumOf (numbers: Int...) -> Int {
			return numbers.count
		}
		
		println("nume of count \(sumOf(3,2)) ")
		println(sumOf(1,3,4))
		
		
		
//		函数可以嵌套。被嵌套的函数可以访问外侧函数的变量,你可以使用嵌套函数来重构一个太 长或者太复杂的函数。
		
		
		
		func returnFifteen() -> Int {
			var y = 10
			
			func add5(){  //函数
				y = y+5
			}
			add5() //函数
			return y
		}
		

//		函数是一等公民（functions are first-class type）,这意味着函数可以作为另一个函数的返回值。
		
		func makeIncrementrr() ->Int {
			func addone (number : Int) ->Int {
				return 1+number
			}
			return addone(7) //返回的是这个函数的返回值
		}
		println("function in function \(makeIncrementrr())")
		
		
		
		
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		func makeInceHighLevel() ->((Int,Int) -> String) {
			
			func addone (number: Int,moreNume:Int) ->String {
				return "number\(number)"
			}
			
			return addone   //返回的是这个函数
		}
		var funcVar = makeInceHighLevel()
		println("function in function \(funcVar(7,8)) ")
		
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		
		//函数也可以当做参数传入另一个函数。
		
		func hasAnyMatches(list: [Int], condition:Int -> Bool) -> Bool { //[Int] 表示int组成的数组   ??????为什么不能用Array呢？
			
			for item in list {
				if condition(item) {
					return true
				}
			}
			return false
		}
		
		func lessThanTen(number:Int) -> Bool {
			return number < 10
		}
		
		var nums = [20 , 19 , 7 ,2]
		hasAnyMatches(nums, lessThanTen)


		
		//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		//??????????????????????????????????
		//	￼函数实际上是一种特殊的闭包,你可以使用{}来创建一个匿名闭包。使用 in 来分割参数并返 回类型
		////
		
		nums.map { (num:Int) ->Int in
			let result = num + 100
			return result
		}
//		“You have several options for writing closures more concisely. When a closure’s type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.”
		//??????????????????
		

		
		//=====================对象和类======================
		
		
		//要创建一个类的实例,在类名后面加上括号。使用点语法来访问实例的属性和方法。
		var calssTest = classSunName(sidelent: 11.0,name: "aaa") //类中的方法的参数要显示说明
		
		var simpleDescription = calssTest.simpleDescription()
		println(simpleDescription)
		println("calsstest(calssTest.perimeter)\(calssTest.perimeter)")
		calssTest.perimeter = 9.0
		println("calsstes\(calssTest.perimeter)  = \(calssTest.sidelenth)")
		class classNameTest {
			//类 也可以写在函数里面
			var testClass = 20.0
		}

		
		var willset = testwillsetDidset()
		willset.testwillset = 20
		
//		类中的方法和一般的函数有一个重要的区别,函数的参数名只在函数内部使用,但是方法的参数名需要在调用的时候显式说明(除了第一个参数)。默认情况下,方法的参数名和它在 方法内部的名字一样,不过你也可以定义第二个名字,这个名字被用在方法内部。
		lessThanTen(44) //func 不用显示说明
		
		
//		处理变量的可选值时,你可以在操作(比如方法、属性和子脚本)之前加?。如果?之前的 值
//		是 nil,?后面的东西都会被忽略,并且整个表达式返回 nil。否则,?之后的东西都会被运行。
//		在这两种情况下,整个表达式的值也是一个可选值。
		
//		let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square" )
		
		
		
		//=====================枚举和结构体======================
//在上面的例子中,枚举原始值的类型是 Int,所以你只需要设置第一个原始值。剩下的原始 值会按照顺序赋值。你也可以使用字符串或者浮点数作为枚举的原始值。  
		enum testRank:Int {
			
			case ace = 1
			case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
			case Jack, Queen, King
			
			func simpDescription () {
				println("dd")
			}
		}
	}//maintest
}
//	使用 class 和类名来创建一个类。类中属性的声明和常量、变量声明一样,唯一的区别就是 它们的上下文是类。同样,方法和函数声明也一样。

//+++++++++++++++++++++++++++++++++++++++++ class +++++++++++++++++++++++++++++++++++++++
class className {
	
	init () {
	}
	
	var perimeter:Double = 0.5
	var number = 0
	func simpleDescription() -> String  {
		return "a class"
	}
	
}



//	子类如果要重写父类的方法的话,需要用 override 标记——如果没有添加 override 就重写 父类方法的话编译器会报错。编译器同样会检测 override 标记的方法是否确实在父类中。


class classSunName: className {
	//属性可以有 getter 和 setter
	
	var sidelenth:Double = 0.0
	//set  get 方法
	override var perimeter:Double {
		get {
			return sidelenth*2
		}
		set {
			//	在 perimeter 的 setter 中,新值的名字是 newValue。你可以在 set 之后显示的设置一个名 字。
			sidelenth  =  newValue/3
			
		}
	}

	init(sidelent:Double ,name:String ) {
		super.init()
		self.sidelenth = sidelent
		
	}
	
	//重写父类方法
	override func simpleDescription() -> String {
		return "a class of a son"
	}
	
}


class testwillsetDidset {
//		如果你不需要计算属性但是需要在设置一个新值之前运行一些代码,使用 willSet 和 didSet。
		var testwillset :Double = 0.0 {   //为什么放到classSunName会报错
			willSet{
				println("testwillset\(newValue)")
			}
			didSet{
				println("didset")
			}
		}
}
