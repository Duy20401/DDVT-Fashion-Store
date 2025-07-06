import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:clothes_store/main.dart' as app; // Thay bằng đường dẫn app của bạn

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login Screen Tests', () {
    // Test case 1: Đăng nhập với email và mật khẩu hợp lệ (Normal case)
    testWidgets('Successful login with valid credentials', (WidgetTester tester) async {
      app.main(); // Khởi động ứng dụng
      await tester.pumpAndSettle();

      // Tìm và nhập email
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.pumpAndSettle();

      // Tìm và nhập mật khẩu
      await tester.enterText(find.byType(TextField).at(1), 'Pass123A!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Kiểm tra xem ứng dụng có chuyển đến màn hình chính không
      expect(find.text('DDTV STORE'), findsOneWidget); // Thay bằng text của màn hình chính
    });

    //Test case 2: Đăng nhập với email không tồn tại (Abnormal case)
    testWidgets('Login with invalid email', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Nhập email không hợp lệ
      await tester.enterText(find.byType(TextField).at(0), 'nonexistent@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'Pass123A!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Kiểm tra thông báo lỗi
      expect(find.text('Email hoặc mật khẩu không đúng'), findsOneWidget); // Thay bằng thông báo thực tế
    });

    // Test case 3: Đăng nhập với mật khẩu không đúng (Abnormal case)
    testWidgets('Login with error password', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Nhập email không hợp lệ
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'WrongPassword!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Kiểm tra thông báo lỗi
      expect(find.text('Email hoặc mật khẩu không đúng'), findsOneWidget); // Thay bằng thông báo thực tế
    });


    // Test case 4: Đăng nhập với email rỗng (Abnormal case)
    testWidgets('Login with empty email', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Nhập mật khẩu nhưng để email rỗng
      await tester.enterText(find.byType(TextField).at(1), 'Pass123A!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Kiểm tra thông báo lỗi
      expect(find.text('Vui lòng nhập email'), findsOneWidget); // Thay bằng thông báo thực tế
    });

    // Test case 5: Đăng nhập với mật khẩu rỗng (Abnormal case)
    testWidgets('Login with empty password', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Nhập email nhưng để mật khẩu rỗng
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Kiểm tra thông báo lỗi
      expect(find.text('Vui lòng nhập password'), findsOneWidget); // Thay bằng thông báo thực tế
    });

    // Test case 6: Đăng nhập với email và mật khẩu rỗng (Abnormal case)
    testWidgets('Login without email and password', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Kiểm tra thông báo lỗi
      expect(find.text('Vui lòng nhập email và mật khẩu'), findsOneWidget); // Thay bằng thông báo thực tế
    });

    //Test case 7: Đăng nhập sai 5 lần (đạt giới hạn) (Abnormal case)
    testWidgets('Login with error password', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Nhập không hợp lệ 1 lần
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'WrongPassword!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Nhập không hợp lệ 2 lần
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'WrongPassword!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Nhập không hợp lệ 3 lần
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'WrongPassword!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Nhập không hợp lệ 4 lần
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'WrongPassword!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Nhập không hợp lệ 5 lần
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'WrongPassword!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Kiểm tra thông báo lỗi
      expect(find.text('Tài khoản đã bị khóa 30 phút do đăng nhập sai 5 lần'), findsOneWidget); // Thay bằng thông báo thực tế
    });

    //Test case 8:Đăng nhập sai 6 lần (vượt giới hạn) (Abnormal case)
    //Test case 7: Đăng nhập sai 5 lần (đạt giới hạn) (Abnormal case)
    testWidgets('Login with error password', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Nhập không hợp lệ 1 lần
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'WrongPassword!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Nhập không hợp lệ 2 lần
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'WrongPassword!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Nhập không hợp lệ 3 lần
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'WrongPassword!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Nhập không hợp lệ 4 lần
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'WrongPassword!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Nhập không hợp lệ 5 lần
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'WrongPassword!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Nhập không hợp lệ 6 lần
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'WrongPassword!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Kiểm tra thông báo lỗi
      expect(find.text('Tài khoản đã bị khóa 30 phút do đăng nhập sai 5 lần'), findsOneWidget); // Thay bằng thông báo thực tế
    });

    // Test case 9: Đăng nhập với email không đúng (Abnormal case)
    testWidgets('Login with invalid email', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Nhập email không hợp lệ
      await tester.enterText(find.byType(TextField).at(0), 'newusergmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'Pass123A!');
      await tester.pumpAndSettle();

      // Nhấn nút "Tiếp tục"
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();

      // Kiểm tra thông báo lỗi
      expect(find.text('Email hoặc mật khẩu không đúng'), findsOneWidget); // Thay bằng thông báo thực tế
    });
  });
}
