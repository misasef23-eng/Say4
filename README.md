# Thiết Bị Hỗ Trợ Giao Tiếp 4 Nút Nhấn Dùng ESP32
*(Phiên bản tối giản, gọn đẹp, ít dây hàn cho người tai biến không thể nói)*

---

## 1. Mục tiêu & Kiểu dáng thiết kế
* **Đối tượng sử dụng:** Người bệnh sau tai biến gặp khó khăn trong phát âm nhưng vẫn có thể nhấn nút.
* **Kiểu dáng khuyên dùng:** Hộp nhỏ cầm tay hoặc có dây đeo cổ (kích thước tương đương hộp diêm lớn hoặc điều khiển cửa cuốn). Thiết kế này tốt hơn đồng hồ đeo tay vì có đủ diện tích đặt **4 nút bấm to, cách xa nhau** giúp bàn tay yếu dễ thao tác và có khoang cộng hưởng giúp loa phát rõ tiếng.
* **Hoạt động độc lập:** Không cần kết nối điện thoại/Wi-Fi, không cần thẻ nhớ ngoài, dùng pin sạc lại qua cổng USB-C.
* **Thời lượng pin:** Hoạt động liên tục từ **7 – 14 ngày** cho mỗi lần sạc (vượt xa yêu cầu tối thiểu 1 ngày).

---

## 2. Danh sách linh kiện (Cấu hình gọn đẹp, ít mối hàn)

Cấu hình này tận dụng bo mạch tích hợp sẵn mạch sạc pin LiPo và lưu trữ âm thanh trực tiếp trong bộ nhớ Flash nội bộ, loại bỏ hoàn toàn mạch sạc rời và module thẻ nhớ.

| STT | Linh kiện | Mẫu khuyên dùng | Vai trò & Lý do chọn |
| :--- | :--- | :--- | :--- |
| **1** | **Vi điều khiển** | **Seeed Studio XIAO ESP32-C3** *(hoặc XIAO ESP32-S3)* | Kích thước siêu nhỏ ($21 \times 17.8\text{ mm}$), tích hợp sẵn **mạch sạc pin LiPo qua USB-C**, bộ nhớ Flash $4\text{MB}$–$8\text{MB}$ dư sức chứa 4 câu thoại. |
| **2** | **Mạch khuếch đại** | **MAX98357A I2S Class-D ($3\text{W}$)** | Giải mã âm thanh số trực tiếp từ ESP32 ra loa, chạy thẳng nguồn pin $3.7\text{V}$, có chân `SD` để ngắt điện hoàn toàn khi nghỉ. |
| **3** | **Loa phát** | **Loa mini $4\,\Omega$ $3\text{W}$** *(loại dẹt/hộp mỏng $\le 23\text{ mm}$)* | Âm lượng lớn, rõ giọng nói trong phòng kín mà vẫn giữ độ mỏng cho vỏ hộp. |
| **4** | **Pin sạc** | **Pin LiPo $3.7\text{V}$ $500\text{mAh}$** *(bắt buộc có mạch bảo vệ PCM)* | Đảm bảo an toàn chống xả cạn (vì bo XIAO chỉ có mạch sạc, không có mạch tự ngắt khi pin yếu). |
| **5** | **Nút nhấn** | **4 nút nhấn kích thước lớn** *(loại $12 \times 12\text{ mm}$ có nắp chụp hoặc nút tròn lớn)* | Lực nhấn nhẹ, bề mặt tiếp xúc rộng, hạn chế bấm nhầm. |

---

## 3. Sơ đồ nối dây tối giản

Tổng cộng chỉ có **13 mối hàn cơ bản**, không cần dùng thêm điện trở hay tụ điện ngoài:

### A. Kết nối nguồn & Loa
* **Pin LiPo $\rightarrow$ XIAO ESP32-C3:**
  * Dây đỏ (`+`) hàn vào pad `BAT+` ở mặt dưới bo XIAO.
  * Dây đen (`-`) hàn vào pad `BAT-` ở mặt dưới bo XIAO.
* **Nguồn cho mạch loa MAX98357A:**
  * `VIN` $\rightarrow$ Nối chung với cực dương pin (`BAT+`) để loa đạt công suất tốt nhất và không gây sụt áp đường nguồn $3.3\text{V}$ của chip.
  * `GND` $\rightarrow$ `GND` của bo XIAO.
* **Loa $4\,\Omega$ $3\text{W}$ $\rightarrow$ MAX98357A:**
  * Hai dây loa hàn trực tiếp vào 2 chân `+` và `-` trên mạch MAX98357A.

### B. Kết nối tín hiệu âm thanh I2S (4 dây)
| Chân MAX98357A | Chân XIAO ESP32-C3 | Chức năng |
| :--- | :--- | :--- |
| **BCLK** | `D0` (GPIO2) | Xung nhịp bit âm thanh |
| **LRC** | `D1` (GPIO3) | Xung chọn kênh trái/phải |
| **DIN** | `D2` (GPIO4) | Dữ liệu âm thanh số |
| **SD** | `D3` (GPIO5) | Bật/tắt ampli (kéo xuống mức thấp khi ngủ để tiết kiệm pin) |

### C. Kết nối 4 nút nhấn (5 dây: 4 dây tín hiệu + 1 dây GND chung)
Sử dụng điện trở kéo lên nội bộ (`INPUT_PULLUP`) của ESP32, mỗi nút nhấn chỉ cần nối 1 chân vào GPIO và 1 chân vào `GND`:
* **Nút 1 (Câu 1 - VD: *"Tôi khát nước"*):** `D4` (GPIO6) và `GND`
* **Nút 2 (Câu 2 - VD: *"Tôi muốn đi vệ sinh"*):** `D5` (GPIO7) và `GND`
* **Nút 3 (Câu 3 - VD: *"Tôi thấy mệt / đau"*):** `D7` (GPIO20) và `GND`
* **Nút 4 (Câu 4 - VD: *"Gọi người nhà giúp tôi"*):** `D10` (GPIO10) và `GND`

---

## 4. Nguyên lý lưu trữ âm thanh & Tiết kiệm pin

1. **Lưu file âm thanh trực tiếp vào Flash (LittleFS):**
   * Thu âm 4 câu nói của người nhà (hoặc dùng giọng đọc AI), chuyển sang định dạng **WAV (16-bit PCM, Mono, tần số lấy mẫu $16\text{kHz}$)**.
   * Mỗi câu dài khoảng $3\text{ giây}$ chỉ tốn $\approx 96\text{ KB}$. Tổng cả 4 câu chưa tới $400\text{ KB}$, chiếm chưa đến $10\%$ dung lượng Flash $4\text{MB}$ của chip.
2. **Cơ chế ngủ Light-sleep siêu tiết kiệm điện:**
   * Khởi động xong, ESP32 **tắt hoàn toàn Wi-Fi và Bluetooth**, kéo chân `SD` của mạch loa xuống mức `LOW` (dòng nghỉ của MAX98357A lúc này $< 1\,\mu\text{A}$).
   * Đưa chip vào chế độ **Light-sleep** (dòng tiêu thụ chỉ khoảng $193\,\mu\text{A}$ trên XIAO C3) và cài đặt ngắt đánh thức trên cả 4 chân nút nhấn.
   * Khi người bệnh bấm nút, thiết bị thức dậy gần như tức thì ($< 5\text{ ms}$), bật chân `SD` lên `HIGH`, phát xong câu thoại rồi lập tức quay lại trạng thái ngủ.

---

## 5. Lưu ý an toàn khi lắp ráp
* **Kiểm tra cực tính pin:** Bo XIAO không có mạch bảo vệ chống ngược cực ở pad `BAT+`/`BAT-`. Cần đo kỹ bằng đồng hồ vạn năng trước khi hàn pin.
* **Bố trí vỏ hộp:** Nên khoét một lỗ nhỏ tiếp cận được cổng **USB-C** của bo XIAO để người nhà có thể cắm sạc bằng cáp điện thoại thông thường mà không cần mở nắp hộp.
* **Chống bấm nhầm:** Nên dán biểu tượng trực quan (ly nước, nhà vệ sinh, chữ thập y tế, chuông gọi) kèm chữ to lên bề mặt 4 nút bấm để người bệnh dễ nhận diện.