// ============================================================================
// VỎ IN 3D THIẾT BỊ HỖ TRỢ GIAO TIẾP 4 NÚT (XIAO ESP32-C3 + MAX98357A)
// Thiết kế: Tối giản, 0% support khi in FDM, khớp chuẩn linh kiện thực tế
// Kích thước thân: 74 x 52 x 18 mm (88 mm tính cả 2 tai dây đồng hồ 22 mm)
// ============================================================================

/* [1. Chọn chi tiết cần xuất STL] */
// Đổi giá trị biến này rồi nhấn F6 (Render) -> File -> Export as STL:
//   "assembly"     : Xem bản lắp ráp + mô phỏng linh kiện bên trong
//   "print_bed"    : Dàn phẳng cả 3 chi tiết sẵn trên bàn in (0% support)
//   "top_shell"    : Xuất riêng vo_tren.stl (đã lật úp sẵn để in)
//   "bottom_shell" : Xuất riêng vo_duoi.stl
//   "button_caps"  : Xuất riêng bộ 4 nắp nút (4_nap_nut.stl)
//   "single_cap"   : Xuất riêng 1 nắp nút (để in từng màu PLA khác nhau)
render_part = "print_bed"; // [assembly, print_bed, top_shell, bottom_shell, button_caps, single_cap]

// Bật/tắt mô phỏng linh kiện bên trong (chỉ hiện ở chế độ "assembly")
show_electronics = true;

// Kéo tách vỏ trên lên theo trục Z ở chế độ "assembly" để soi bên trong
assembly_exploded = 0; // [0:0.5:25]

/* [2. Thông số linh kiện thực tế (chỉnh tại đây nếu mua loại khác)] */
// Chiều cao tổng công tắc nhấn 12x12mm (loại phổ thông: 4.3, 5.0, 6.0 hoặc 7.3 mm)
switch_total_h = 5.0;
// Đường kính & độ dày loa mỏng mini (mặc định Ø28mm, dày 4.5-5.0mm)
speaker_dia = 28.0;
speaker_h   = 5.0;
// Kích thước pin LiPo dẹt (mặc định 502535 hoặc 602535: 25 x 35 x 5~6mm)
bat_w = 25.0;
bat_l = 35.0;
bat_h = 6.0;
// Lớp cầu mỏng 0.2mm che lỗ vít đáy (in 0% support; khi lắp lấy tua-vít/ốc đâm thủng)
use_sacrificial_bridge = true;

/* [3. Dung sai máy in FDM (tăng lên 0.25-0.30 nếu máy in hơi nở nét)] */
lip_tol = 0.20;

// ============================================================================
// THÔNG SỐ CƠ KHÍ NỘI BỘ (ĐÃ KIỂM TRA KHE HỞ KHÔNG VA CHẠM)
// ============================================================================
$fn = 64;

W       = 52.0;   // Rộng thân vỏ (X)
L       = 74.0;   // Dài thân vỏ (Y)
H       = 18.0;   // Dày tổng (Z)
WALL    = 2.0;    // Độ dày thành vỏ
FLOOR   = 2.0;    // Độ dày đáy vỏ dưới
CEIL    = 2.0;    // Độ dày mặt vỏ trên
R_OUT   = 5.0;    // Bo góc ngoài
SPLIT_Z = 10.5;   // Đường chia giữa vỏ dưới (10.5mm) và vỏ trên (7.5mm)
LIP_H   = 1.2;    // Chiều cao gờ khớp 2 nửa vỏ
LIP_T   = 0.85;   // Độ dày gờ khớp (đủ 2 vòng vòi phun 0.4mm)

// 4 trụ bắt vít M2 x 8mm
BOSS_X     = 21.6;
BOSS_Y     = 32.6;
BOSS_R     = 2.4;  // Đường kính trụ 4.8mm
M2_PILOT_D = 1.75; // Lỗ tự taro vít M2 trên vỏ trên
M2_CLEAR_D = 2.3;  // Lỗ thông vít M2 trên vỏ dưới
M2_HEAD_D  = 4.6;  // Hốc chìm đầu vít M2 trên vỏ dưới (không cấn cổ tay)

// 4 nút bấm (cột trái)
BTN_X        = -13.2;
BTN_PITCH    = 15.2;
BTN_YS       = [1.5*BTN_PITCH, 0.5*BTN_PITCH, -0.5*BTN_PITCH, -1.5*BTN_PITCH];
CAP_D        = 12.0;
CAP_HOLE_D   = 12.6; // Khe hở 0.3mm mỗi bên để nút trượt mượt
FLANGE_D     = 14.2;
FLANGE_H     = 1.5;
CAP_PROTRUDE = 2.2;  // Phần nút nhô lên khỏi mặt vỏ trên
SW_POCKET    = 12.3; // Hốc ôm công tắc 12x12mm (+0.3mm dung sai)

// Loa (góc trên phải - vỏ trên)
SPK_X        = 9.5;
SPK_Y        = 15.5;
SPK_POCKET_D = speaker_dia + 0.4;

// Pin LiPo (bên phải vỏ dưới, nằm dưới loa với khe hở dọc 2.5mm)
BAT_X_C      = 8.6;
BAT_Y_C      = 11.1;
BAT_POCKET_W = bat_w + 0.8;
BAT_POCKET_L = bat_l + 0.8;

// Seeed Studio XIAO ESP32-C3 (góc dưới phải vỏ dưới, USB-C hướng mép phải +X)
// Bo gốc: 21.0 x 17.8 mm
XIAO_L      = 21.5;
XIAO_W      = 18.2;
XIAO_X_MAX  = W/2 - WALL;              // +24.0 (áp sát thành phải)
XIAO_X_C    = XIAO_X_MAX - XIAO_L/2;   // +13.25
XIAO_Y_C    = -18.9;                   // Y từ -28.0 đến -9.8
XIAO_RAIL_H = 1.8;                     // Nâng bo 1.8mm để hở pad BAT+/BAT- mặt lưng
XIAO_PCB_H  = 1.2;
USBC_Z_C    = FLOOR + XIAO_RAIL_H + XIAO_PCB_H + 1.6; // Z = 6.6mm (tâm cổng USB-C)

// Module MAX98357A (góc dưới phải mặt trong vỏ trên, nằm phía trên XIAO)
// Bo gốc: 19.4 x 17.8 mm (LƯU Ý: KHÔNG hàn domino xanh, hàn thẳng dây loa vào lỗ)
MAX_L   = 20.0;
MAX_W   = 18.4;
MAX_X_C = 12.0;   // X từ +2.0 đến +22.0
MAX_Y_C = -18.4;  // Y từ -27.6 đến -9.2

// Tai luồn dây đồng hồ 22mm (nằm trên vỏ dưới, phẳng tại Z=0 -> 0% support)
STRAP_W    = 22.0;
LUG_ARM_W  = 4.0;
LUG_SLOT_L = 4.0;
LUG_BAR_L  = 3.0;
LUG_H      = 4.2;

// ============================================================================
// HÀM HỖ TRỢ HÌNH HỌC
// ============================================================================
module rounded_rect_2d(w, l, r) {
    offset(r = r)
        square([w - 2*r, l - 2*r], center = true);
}

module pill_2d(w, h) {
    hull() {
        translate([-(w - h)/2, 0]) circle(d = h);
        translate([ (w - h)/2, 0]) circle(d = h);
    }
}

module corner_positions() {
    for (sx = [-1, 1], sy = [-1, 1])
        translate([sx * BOSS_X, sy * BOSS_Y])
            children();
}

// ============================================================================
// CHI TIẾT 1: VỎ DƯỚI (BOTTOM SHELL) - CHỨA PIN, XIAO, 4 CÔNG TẮC, TAI DÂY ĐEO
// ============================================================================
module bottom_shell() {
    // Cao độ đáy công tắc tự động tính theo switch_total_h
    // Mặt dưới vành nút ở Z = H - CEIL - FLANGE_H = 14.5mm; chừa 0.2mm rơ => đỉnh công tắc 14.3mm
    sw_seat_z = (H - CEIL - FLANGE_H - 0.2) - switch_total_h;
    sw_rim_h  = 2.4;

    difference() {
        union() {
            // 1. Thân vỏ dưới (đáy + thành ngoài)
            difference() {
                linear_extrude(height = SPLIT_Z)
                    rounded_rect_2d(W, L, R_OUT);
                translate([0, 0, FLOOR])
                    linear_extrude(height = SPLIT_Z + 1)
                        rounded_rect_2d(W - 2*WALL, L - 2*WALL, R_OUT - WALL);
            }

            // 2. Gờ khớp (lap joint) ở nửa trong thành vỏ (dày 0.85mm)
            translate([0, 0, SPLIT_Z])
                linear_extrude(height = LIP_H)
                    difference() {
                        rounded_rect_2d(W - 2*(WALL - LIP_T), L - 2*(WALL - LIP_T), R_OUT - (WALL - LIP_T));
                        rounded_rect_2d(W - 2*WALL, L - 2*WALL, R_OUT - WALL);
                    }

            // 3. Hai tai luồn dây đồng hồ 22mm (nằm phẳng tại Z=0 -> 0% support)
            for (sy = [-1, 1]) {
                scale([1, sy, 1])
                translate([0, L/2, 0])
                linear_extrude(height = LUG_H) {
                    difference() {
                        hull() {
                            translate([0, -1]) square([STRAP_W + 2*LUG_ARM_W, 2], center = true);
                            translate([-(STRAP_W/2 + LUG_ARM_W - 2.2), LUG_SLOT_L + LUG_BAR_L - 2.2]) circle(r = 2.2);
                            translate([ (STRAP_W/2 + LUG_ARM_W - 2.2), LUG_SLOT_L + LUG_BAR_L - 2.2]) circle(r = 2.2);
                        }
                        // Khe xỏ dây 22 x 4 mm
                        translate([0, LUG_SLOT_L/2])
                            rounded_rect_2d(STRAP_W, LUG_SLOT_L, 1.2);
                    }
                }
            }

            // 4. Bốn trụ bắt vít M2 (gộp vào khối chính trước khi khoan xuyên đáy)
            corner_positions()
                cylinder(r = BOSS_R, h = 7.5);
        }

        // --- CÁC PHẦN KHOÉT XUYÊN VỎ DƯỚI ---

        // Khoét hốc chìm đầu vít & lỗ xuyên vít M2 xuyên từ đáy Z = 0
        corner_positions() {
            // Hốc chìm đầu vít M2 (Z = -0.1 đến 5.0)
            translate([0, 0, -0.1])
                cylinder(d = M2_HEAD_D, h = 5.1);
            // Lỗ thông vít M2 (chừa cầu 0.2mm tại Z=5.0..5.2 nếu bật use_sacrificial_bridge)
            bridge_z = use_sacrificial_bridge ? 5.2 : 4.9;
            translate([0, 0, bridge_z])
                cylinder(d = M2_CLEAR_D, h = 3.0);
        }

        // Khoét gờ khớp tại khu vực 4 trụ ốc góc để tránh va chạm trụ vỏ trên
        translate([0, 0, SPLIT_Z - 0.1])
            corner_positions()
                cylinder(r = BOSS_R + 0.5, h = LIP_H + 1);

        // Khoét khe cổng sạc USB-C trên thành phải (+X)
        translate([W/2 - WALL/2, XIAO_Y_C, USBC_Z_C])
            rotate([0, 90, 0])
                rotate([0, 0, 90])
                    linear_extrude(height = WALL + 2, center = true)
                        pill_2d(10.4, 4.6);

        // Vát hốc nông bên ngoài cổng USB-C (0.6mm) để đầu cắm nhựa dày cắm hết cỡ
        translate([W/2 - 0.3, XIAO_Y_C, USBC_Z_C])
            rotate([0, 90, 0])
                rotate([0, 0, 90])
                    linear_extrude(height = 1.2, center = true)
                        pill_2d(13.0, 6.8);

        // Lỗ đèn LED báo sạc (Ø2.0mm) ngay cạnh cổng USB-C
        translate([W/2 - WALL/2, XIAO_Y_C + 6.2, USBC_Z_C])
            rotate([0, 90, 0])
                cylinder(d = 2.0, h = WALL + 2, center = true);
    }

    // --- CÁC KHỐI ĐỠ LINH KIỆN BÊN TRONG VỎ DƯỚI ---

    // 5. Bệ đỡ 4 công tắc nhấn 12x12mm (có rãnh luồn chân hàn phía dưới)
    for (by = BTN_YS) {
        translate([BTN_X, by, FLOOR]) {
            difference() {
                union() {
                    // Đế nâng tới sw_seat_z
                    translate([0, 0, (sw_seat_z - FLOOR)/2])
                        cube([SW_POCKET + 2.0, SW_POCKET + 2.0, sw_seat_z - FLOOR], center = true);
                    // Thành định vị cao thêm sw_rim_h
                    translate([0, 0, (sw_seat_z - FLOOR) + sw_rim_h/2])
                        cube([SW_POCKET + 2.0, SW_POCKET + 2.0, sw_rim_h], center = true);
                }
                // Khoét hốc đặt thân công tắc 12.3 x 12.3 mm
                translate([0, 0, (sw_seat_z - FLOOR) + sw_rim_h/2 + 0.1])
                    cube([SW_POCKET, SW_POCKET, sw_rim_h + 0.4], center = true);
                // Khoét rãnh hở bên dưới thân công tắc cho chân kim loại & dây hàn
                translate([1.0, 0, (sw_seat_z - FLOOR)/2 + 0.6])
                    cube([SW_POCKET + 0.5, SW_POCKET - 2.6, max(1.0, (sw_seat_z - FLOOR) - 0.8)], center = true);
                // Rãnh mở cạnh phải (+X) để đưa dây nút bấm sang XIAO
                translate([(SW_POCKET + 2.0)/2, 0, (sw_seat_z - FLOOR) - 0.5])
                    cube([3.0, 6.0, 4.0], center = true);
            }
        }
    }

    // 6. Khay định vị XIAO ESP32-C3 (2 thanh ray nâng 1.8mm + vách chặn lực cắm USB-C)
    translate([XIAO_X_C, XIAO_Y_C, FLOOR]) {
        for (sy = [-1, 1]) {
            // 2 thanh ray nâng dọc cạnh trên/dưới bo (giữa để trống cho pad BAT+/BAT-)
            translate([0, sy * (XIAO_W/2 - 1.2), XIAO_RAIL_H/2])
                cube([XIAO_L, 2.2, XIAO_RAIL_H], center = true);
            // Thành kẹp 2 bên hông bo XIAO (cao 4.2mm)
            translate([0, sy * (XIAO_W/2 + 0.6), 2.1])
                cube([XIAO_L - 2.0, 1.2, 4.2], center = true);
        }
        // Vách chặn sau lưng XIAO (chịu lực ấn khi cắm cáp USB-C, có khe luồn dây)
        for (sy = [-1, 1]) {
            translate([-(XIAO_L/2 + 0.7), sy * 5.2, 2.3])
                cube([1.4, 5.0, 4.6], center = true);
        }
    }

    // 7. Gờ định vị Pin LiPo 502535/602535 (gờ thấp 3.5mm 3 cạnh để thoáng dây)
    translate([BAT_X_C, BAT_Y_C, FLOOR]) {
        // Gờ trái (-X)
        translate([-(BAT_POCKET_W/2 + 0.6), 0, 1.75])
            cube([1.2, BAT_POCKET_L - 6.0, 3.5], center = true);
        // Gờ trên (+Y)
        translate([0, (BAT_POCKET_L/2 + 0.6), 1.75])
            cube([BAT_POCKET_W - 8.0, 1.2, 3.5], center = true);
        // Gờ dưới (-Y, chừa khe giữa cho 2 dây pin đi thẳng sang XIAO)
        for (sx = [-1, 1]) {
            translate([sx * (BAT_POCKET_W/2 - 3.5), -(BAT_POCKET_L/2 + 0.6), 1.75])
                cube([6.0, 1.2, 3.5], center = true);
        }
    }
}

// ============================================================================
// CHI TIẾT 2: VỎ TRÊN (TOP SHELL) - MẶT LƯỚI LOA, 4 LỖ NÚT, HỐC MAX98357A
// ============================================================================
module top_shell() {
    cut_inset = WALL - LIP_T - lip_tol; // Thành ngoài vỏ trên còn lại 0.95mm (đủ 2+ nét in)

    difference() {
        // 1. Thân vỏ trên (từ Z = SPLIT_Z đến H)
        translate([0, 0, SPLIT_Z])
            linear_extrude(height = H - SPLIT_Z)
                rounded_rect_2d(W, L, R_OUT);

        // Khoét lòng rỗng bên trong vỏ trên (chừa trần dày CEIL = 2.0mm)
        translate([0, 0, SPLIT_Z - 0.1])
            linear_extrude(height = (H - CEIL) - SPLIT_Z + 0.1)
                rounded_rect_2d(W - 2*WALL, L - 2*WALL, R_OUT - WALL);

        // Khoét bậc khớp (lap joint) ở mép dưới vỏ trên để ôm khít gờ vỏ dưới
        translate([0, 0, SPLIT_Z - 0.1])
            linear_extrude(height = LIP_H + 0.35)
                rounded_rect_2d(W - 2*cut_inset, L - 2*cut_inset, R_OUT - cut_inset);

        // 2. Khoét 4 lỗ tròn Ø12.6mm cho 4 nắp nút
        for (by = BTN_YS) {
            translate([BTN_X, by, H - CEIL - 0.5])
                cylinder(d = CAP_HOLE_D, h = CEIL + 1.0);
        }

        // 3. Khoét lưới loa đồng tâm (lỗ Ø1.6mm, đẹp & thoáng tiếng)
        translate([SPK_X, SPK_Y, H - CEIL - 0.5]) {
            cylinder(d = 2.0, h = CEIL + 1.0); // Lỗ tâm
            for (ring = [1 : 3]) {
                r_ring = ring * 3.5;
                count  = ring * 6;
                for (i = [0 : count - 1]) {
                    ang = i * 360 / count;
                    translate([r_ring * cos(ang), r_ring * sin(ang), 0])
                        cylinder(d = 1.6, h = CEIL + 1.0);
                }
            }
        }
    }

    // --- CÁC KHỐI ĐỠ BÊN TRONG MẶT TRẦN VỎ TRÊN ---

    // 4. Bốn trụ bắt vít M2 kéo dài xuống Z = 7.5mm (ăn khớp mặt trụ vỏ dưới)
    difference() {
        corner_positions()
            translate([0, 0, 7.5])
                cylinder(r = BOSS_R, h = (H - CEIL) - 7.5);
        // Lỗ taro M2 sâu 6.5mm (Z = 7.4 đến 14.0, vừa khít vít M2 x 8mm)
        corner_positions()
            translate([0, 0, 7.4])
                cylinder(d = M2_PILOT_D, h = 6.6);
    }

    // 5. Vành giữ loa Ø28mm (cao 5.0mm từ trần xuống, có khe ra dây loa hướng về MAX98357A)
    translate([SPK_X, SPK_Y, H - CEIL - speaker_h]) {
        difference() {
            cylinder(d = SPK_POCKET_D + 2.2, h = speaker_h);
            translate([0, 0, -0.1])
                cylinder(d = SPK_POCKET_D, h = speaker_h + 0.2);
            // Khe ra 2 dây loa ở cạnh dưới (-Y)
            translate([0, -SPK_POCKET_D/2, -0.1])
                cube([7.0, 5.0, speaker_h + 0.2], center = true);
            // Cắt phẳng phần vành nếu chạm thành phải (+X)
            translate([(W/2 - WALL) - SPK_X + 5.0, 0, speaker_h/2])
                cube([10.0, 40.0, speaker_h + 1.0], center = true);
        }
    }

    // 6. Khay gá module MAX98357A (nằm góc dưới phải trần vỏ trên, cách XIAO 4.2mm)
    translate([MAX_X_C, MAX_Y_C, H - CEIL]) {
        // 4 điểm kê góc cao 1.2mm tránh cấn linh kiện mặt lưng MAX98357A
        for (sx = [-1, 1], sy = [-1, 1]) {
            translate([sx * (MAX_L/2 - 1.5), sy * (MAX_W/2 - 1.5), -0.6])
                cube([2.4, 2.4, 1.2], center = true);
        }
        // 3 vách định vị (trên +Y, dưới -Y, phải +X; mở cạnh trái -X để đi dây I2S)
        translate([0,  (MAX_W/2 + 0.6), -1.75]) cube([MAX_L, 1.2, 3.5], center = true);
        translate([0, -(MAX_W/2 + 0.6), -1.75]) cube([MAX_L, 1.2, 3.5], center = true);
        translate([(MAX_L/2 + 0.6), 0, -1.75])  cube([1.2, MAX_W + 2.4, 3.5], center = true);
    }
}

// ============================================================================
// CHI TIẾT 3: NẮP NÚT BẤM (CÓ VÀNH CHẮN CHỐNG TỤT, IN NGỬA 0% SUPPORT)
// ============================================================================
module button_cap() {
    cap_total_h = CEIL + CAP_PROTRUDE; // 2.0 + 2.2 = 4.2 mm
    union() {
        // Vành chắn mặt dưới Ø14.2mm (đặt phẳng Z=0 khi in)
        cylinder(d = FLANGE_D, h = FLANGE_H);
        // Thân trụ nút Ø12.0mm + vát mép trên cho êm ngón tay
        translate([0, 0, FLANGE_H]) {
            cylinder(d = CAP_D, h = cap_total_h - 0.8);
            translate([0, 0, cap_total_h - 0.8])
                cylinder(d1 = CAP_D, d2 = CAP_D - 1.4, h = 0.8);
        }
    }
}

// ============================================================================
// MÔ PHỎNG LINH KIỆN BÊN TRONG (CHỈ DÙNG ĐỂ KIỂM TRA LẮP RÁP)
// ============================================================================
module dummy_electronics() {
    sw_seat_z = (H - CEIL - FLANGE_H - 0.2) - switch_total_h;

    // 4 công tắc 12x12mm
    color("DimGray")
    for (by = BTN_YS) {
        translate([BTN_X, by, sw_seat_z]) {
            translate([0, 0, 1.75]) cube([12, 12, 3.5], center = true);
            translate([0, 0, 3.5])  cylinder(d = 6.7, h = switch_total_h - 3.5);
        }
    }
    // Pin LiPo
    color("Silver")
        translate([BAT_X_C, BAT_Y_C, FLOOR + bat_h/2])
            cube([bat_w, bat_l, bat_h], center = true);
    // XIAO ESP32-C3 + cổng USB-C
    color("DarkSlateGray")
        translate([XIAO_X_C, XIAO_Y_C, FLOOR + XIAO_RAIL_H + XIAO_PCB_H/2])
            cube([21.0, 17.8, XIAO_PCB_H], center = true);
    color("LightGray")
        translate([XIAO_X_MAX - 2.5, XIAO_Y_C, USBC_Z_C])
            cube([7.5, 9.0, 3.2], center = true);
    // Loa Ø28mm (gắn vỏ trên)
    color("Black")
        translate([SPK_X, SPK_Y, H - CEIL - speaker_h + assembly_exploded])
            cylinder(d = speaker_dia, h = speaker_h);
    // MAX98357A (gắn vỏ trên)
    color("Purple")
        translate([MAX_X_C, MAX_Y_C, H - CEIL - 2.6 + assembly_exploded])
            cube([19.4, 17.8, 2.4], center = true);
}

// ============================================================================
// ĐIỀU KHIỂN HIỂN THỊ & XUẤT FILE STL
// ============================================================================
if (render_part == "assembly") {
    color("SlateGray") bottom_shell();
    translate([0, 0, assembly_exploded]) {
        color("DimGray", 0.85) top_shell();
        cap_colors = ["Crimson", "Gold", "ForestGreen", "RoyalBlue"];
        for (i = [0 : 3]) {
            color(cap_colors[i])
                translate([BTN_X, BTN_YS[i], H - CEIL - FLANGE_H])
                    button_cap();
        }
    }
    if (show_electronics) dummy_electronics();
}
else if (render_part == "bottom_shell") {
    bottom_shell();
}
else if (render_part == "top_shell") {
    // Tự động lật úp 180° đặt mặt loa phẳng xuống bàn in Z=0 (0% support)
    translate([0, 0, H])
        rotate([0, 180, 0])
            top_shell();
}
else if (render_part == "button_caps") {
    for (i = [0 : 3])
        translate([i * (FLANGE_D + 3.0), 0, 0])
            button_cap();
}
else if (render_part == "single_cap") {
    button_cap();
}
else if (render_part == "print_bed") {
    // Vỏ dưới bên trái
    translate([-W/2 - 4, 0, 0])
        bottom_shell();
    // Vỏ trên lật úp bên phải
    translate([W/2 + 4, 0, H])
        rotate([0, 180, 0])
            top_shell();
    // 4 nắp nút xếp hàng phía dưới
    for (i = [0 : 3])
        translate([-27 + i * 18, -L/2 - 18, 0])
            button_cap();
}
