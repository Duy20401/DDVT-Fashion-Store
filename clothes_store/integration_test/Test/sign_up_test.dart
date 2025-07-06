import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:clothes_store/main.dart' as app; // Thay bằng đường dẫn app của bạn

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Sign Up Screen Tests', () {
    // Test case 1: Đăng ký với toàn bộ thông tin hợp lệ (Normal case)
    testWidgets('Successful sign up with valid credentials', (WidgetTester tester) async {
      app.main(); // Khởi động ứng dụng
      await tester.pumpAndSettle();

      // Điều hướng đến màn hình đăng ký
      await tester.tap(find.text('Không có tài khoản ?'));
      await tester.pumpAndSettle();

      // Nhập các trường theo đúng thứ tự
      await tester.enterText(find.byType(TextField).at(0), 'Nguyen Van An'); // FullName
      await tester.enterText(find.byType(TextField).at(1), '0909123456'); // Phone
      await tester.enterText(find.byType(TextField).at(2), 'newuser1@gmail.com'); // Email
      await tester.enterText(find.byType(TextField).at(3), 'Pass123A!'); // Password
      await tester.enterText(find.byType(TextField).at(4), 'Pass123A!'); // Confirm Password
      await tester.pumpAndSettle();

      // Nhấn nút đăng ký
      await tester.tap(find.text('Hoàn tất'));
      await tester.pumpAndSettle();

      // Kiểm tra thông báo thành công và chuyển màn hình
      expect(find.text('Đăng ký thành công'), findsOneWidget);
    });

    // Test case 2: Đăng ký với email đã tồn tại (Abnormal case)
    testWidgets('Sign up with existing email', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Không có tài khoản ?'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).at(0), 'Tran Thi B'); // FullName
      await tester.enterText(find.byType(TextField).at(1), '0987654321'); // Phone
      await tester.enterText(find.byType(TextField).at(2), 'newuser1@gmail.com'); // Email
      await tester.enterText(find.byType(TextField).at(3), 'Test123Ab!'); // Password
      await tester.enterText(find.byType(TextField).at(4), 'Test123Ab!'); // Confirm Password
      await tester.pumpAndSettle();

      await tester.tap(find.text('Hoàn tất'));
      await tester.pumpAndSettle();

      expect(find.text('Email đã được sử dụng'), findsOneWidget);
    });

    // Test case 3: Đăng ký với email không hợp lệ (Abnormal case)
    testWidgets('Sign up with invalid email', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Không có tài khoản ?'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).at(0), 'Le Van C'); // FullName
      await tester.enterText(find.byType(TextField).at(1), '0912345678'); // Phone
      await tester.enterText(find.byType(TextField).at(2), 'newusergmail.com'); // Email
      await tester.enterText(find.byType(TextField).at(3), 'Pass123A!'); // Password
      await tester.enterText(find.byType(TextField).at(4), 'Pass123A!'); // Confirm Password
      await tester.pumpAndSettle();

      await tester.tap(find.text('Hoàn tất'));
      await tester.pumpAndSettle();

      expect(find.text('Email không hợp lệ'), findsOneWidget);
    });

    // Test case 4: Đăng ký với email rỗng (Abnormal case)
    testWidgets('Sign up with empty email', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Không có tài khoản ?'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).at(0), 'Pham Thi D'); // FullName
      await tester.enterText(find.byType(TextField).at(1), '0923456789'); // Phone
      // Để email rỗng
      await tester.enterText(find.byType(TextField).at(3), 'Pass123A!'); // Password
      await tester.enterText(find.byType(TextField).at(4), 'Pass123A!'); // Confirm Password
      await tester.pumpAndSettle();

      await tester.tap(find.text('Hoàn tất'));
      await tester.pumpAndSettle();

      expect(find.text('Vui lòng nhập email'), findsOneWidget);
    });

    // Test case 5: Đăng ký với mật khẩu quá ngắn (Abnormal case)
    testWidgets('Sign up with password too short', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Không có tài khoản ?'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).at(0), 'Hoang Van E'); // FullName
      await tester.enterText(find.byType(TextField).at(1), '0934567855'); // Phone
      await tester.enterText(find.byType(TextField).at(2), 'hoangvanhihi@gmail.com'); // Email
      await tester.enterText(find.byType(TextField).at(3), 'Pass1'); // Password
      await tester.enterText(find.byType(TextField).at(4), 'Pass1'); // Confirm Password
      await tester.pumpAndSettle();

      await tester.tap(find.text('Hoàn tất'));
      await tester.pumpAndSettle();

      expect(find.text('User validation failed: password: Mật khẩu phải có ít nhất 6 ký tự'), findsOneWidget);
    });

    // Test case 6: Đăng ký với mật khẩu không đủ yêu cầu (Abnormal case)
    testWidgets('Sign up with password not meeting requirements', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Không có tài khoản ?'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).at(0), 'Ngo Thi F'); // FullName
      await tester.enterText(find.byType(TextField).at(1), '0945678901'); // Phone
      await tester.enterText(find.byType(TextField).at(2), 'ngothi@gmail.com'); // Email
      await tester.enterText(find.byType(TextField).at(3), 'password'); // Password
      await tester.enterText(find.byType(TextField).at(4), 'password'); // Confirm Password
      await tester.pumpAndSettle();

      await tester.tap(find.text('Hoàn tất'));
      await tester.pumpAndSettle();

      expect(find.text('User validation failed: password: Mật khẩu phải chứa ít nhất 1 chữ hoa, 1 chữ thường và 1 số'), findsOneWidget);
    });

    // Test case 7: Đăng ký với mật khẩu nhập lại không khớp (Abnormal case)
    testWidgets('Sign up with mismatched confirm password', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Không có tài khoản ?'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).at(0), 'Vu Van G'); // FullName
      await tester.enterText(find.byType(TextField).at(1), '0956789012'); // Phone
      await tester.enterText(find.byType(TextField).at(2), 'vuvang@gmail.com'); // Email
      await tester.enterText(find.byType(TextField).at(3), 'Pass123A!'); // Password
      await tester.enterText(find.byType(TextField).at(4), 'Wrong123A!'); // Confirm Password
      await tester.pumpAndSettle();

      await tester.tap(find.text('Hoàn tất'));
      await tester.pumpAndSettle();

      expect(find.text('Password và password verify không khớp'), findsOneWidget);
    });

    // Test case 8: Đăng ký với số điện thoại không hợp lệ (Abnormal case)
    testWidgets('Sign up with invalid phone number', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Không có tài khoản ?'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).at(0), 'Do Thi H'); // FullName
      await tester.enterText(find.byType(TextField).at(1), '0123456789999'); // Phone
      await tester.enterText(find.byType(TextField).at(2), 'dothi@gmail.com'); // Email
      await tester.enterText(find.byType(TextField).at(3), 'Pass123A!'); // Password
      await tester.enterText(find.byType(TextField).at(4), 'Pass123A!'); // Confirm Password
      await tester.pumpAndSettle();

      await tester.tap(find.text('Hoàn tất'));
      await tester.pumpAndSettle();

      expect(find.text('Số điện thoại không hợp lệ'), findsOneWidget);
    });

    // Test case 9: Đăng ký với số điện thoại rỗng (Abnormal case)
    testWidgets('Sign up with empty phone number', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Không có tài khoản ?'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).at(0), 'Lam Van I'); // FullName
      // Để phone rỗng
      await tester.enterText(find.byType(TextField).at(2), 'lamvan@gmail.com'); // Email
      await tester.enterText(find.byType(TextField).at(3), 'Pass123A!'); // Password
      await tester.enterText(find.byType(TextField).at(4), 'Pass123A!'); // Confirm Password
      await tester.pumpAndSettle();

      await tester.tap(find.text('Hoàn tất'));
      await tester.pumpAndSettle();

      expect(find.text('Vui lòng nhập số điện thoại'), findsOneWidget);
    });

    // Test case 10: Đăng ký với họ tên quá ngắn (Abnormal case)
    testWidgets('Sign up with too short full name', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Không có tài khoản ?'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).at(0), 'A'); // FullName
      await tester.enterText(find.byType(TextField).at(1), '0978901234'); // Phone
      await tester.enterText(find.byType(TextField).at(2), 'test12345@gmail.com'); // Email
      await tester.enterText(find.byType(TextField).at(3), 'Pass123A!'); // Password
      await tester.enterText(find.byType(TextField).at(4), 'Pass123A!'); // Confirm Password
      await tester.pumpAndSettle();

      await tester.tap(find.text('Hoàn tất'));
      await tester.pumpAndSettle();

      expect(find.text('User validation failed: fullname: Họ và tên phải có ít nhất 2 ký tự'), findsOneWidget);
    });

    // Test case 11: Đăng ký với họ tên quá dài (Abnormal case)
    testWidgets('Sign up with too long full name', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Không có tài khoản ?'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).at(0), 'Nguyen Van A Very Very Long Name'); // FullName
      await tester.enterText(find.byType(TextField).at(1), '0989012345'); // Phone
      await tester.enterText(find.byType(TextField).at(2), 'longname@gmail.com'); // Email
      await tester.enterText(find.byType(TextField).at(3), 'Pass123A!'); // Password
      await tester.enterText(find.byType(TextField).at(4), 'Pass123A!'); // Confirm Password
      await tester.pumpAndSettle();

      await tester.tap(find.text('Hoàn tất'));
      await tester.pumpAndSettle();

      expect(find.text('User validation failed: fullname: Họ và tên không được vượt quá 50 ký tự'), findsOneWidget);
    });

    // Test case 12: Đăng ký với họ tên rỗng (Abnormal case)
    testWidgets('Sign up with empty full name', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Không có tài khoản ?'));
      await tester.pumpAndSettle();

      // Để full name rỗng
      await tester.enterText(find.byType(TextField).at(1), '0989012345'); // Phone
      await tester.enterText(find.byType(TextField).at(2), 'tranvan@gmail.com'); // Email
      await tester.enterText(find.byType(TextField).at(3), 'Pass123A!'); // Password
      await tester.enterText(find.byType(TextField).at(4), 'Pass123A!'); // Confirm Password
      await tester.pumpAndSettle();

      await tester.tap(find.text('Hoàn tất'));
      await tester.pumpAndSettle();

      expect(find.text('Vui lòng nhập fullname'), findsOneWidget);
    });

    // Test case 13: Đăng ký với tất cả thông tin rỗng (Abnormal case)
    testWidgets('Sign up with all fields empty', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Không có tài khoản ?'));
      await tester.pumpAndSettle();

      // Để tất cả các trường rỗng
      await tester.pumpAndSettle();

      await tester.tap(find.text('Hoàn tất'));
      await tester.pumpAndSettle();

      expect(find.text('Vui lòng nhập đầy đủ thông tin'), findsOneWidget);
    });
  });
}