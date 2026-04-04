% Auto-generated from uploaded Chapter II text.
% Focus: Articles 6-12 in the provided file.
% Canonical fields: subject/action/context/exception_ref use English-style labels; original_vi_text preserves source wording.

rule(d6_k1_a).
rule_type(d6_k1_a,primary_violation).
article(d6_k1_a,6).
clause(d6_k1_a,1).
point(d6_k1_a,"a").
subject(d6_k1_a,car).
action(d6_k1_a,disobey_road_signs_or_markings).
fine_min(d6_k1_a,400000).
fine_max(d6_k1_a,600000).
original_vi_text(d6_k1_a,"Không chấp hành hiệu lệnh, chỉ dẫn của biển báo hiệu, vạch kẻ đường").

rule(d6_k1_b).
rule_type(d6_k1_b,primary_violation).
article(d6_k1_b,6).
clause(d6_k1_b,1).
point(d6_k1_b,"b").
subject(d6_k1_b,car).
action(d6_k1_b,no_signal_when_entering_or_leaving_parking_position).
fine_min(d6_k1_b,400000).
fine_max(d6_k1_b,600000).
original_vi_text(d6_k1_b,"Khi ra, vào vị trí dừng xe, đỗ xe không có tín hiệu báo cho người điều khiển phương tiện khác biết").

rule(d6_k1_c).
rule_type(d6_k1_c,primary_violation).
article(d6_k1_c,6).
clause(d6_k1_c,1).
point(d6_k1_c,"c").
subject(d6_k1_c,car).
action(d6_k1_c,no_hazard_light_or_warning_sign).
exception_ref(d6_k1_c,6,7,"c").
fine_min(d6_k1_c,400000).
fine_max(d6_k1_c,600000).
original_vi_text(d6_k1_c,"Không báo hiệu bằng đèn khẩn cấp hoặc không đặt biển cảnh báo \"Chú ý xe đỗ\" theo quy định trong trường hợp gặp sự cố kỹ thuật (hoặc bất khả kháng khác) buộc phải đỗ xe chiếm một phần đường xe chạy hoặc tại nơi không được phép đỗ xe").

rule(d6_k1_d_1).
rule_type(d6_k1_d_1,primary_violation).
article(d6_k1_d_1,6).
clause(d6_k1_d_1,1).
point(d6_k1_d_1,"d").
subject(d6_k1_d_1,car).
action(d6_k1_d_1,no_near_sign_signal_signal_car_phia_truoc_vehicle_keo_phia_sau_vehicle_duoc).
fine_min(d6_k1_d_1,400000).
fine_max(d6_k1_d_1,600000).
original_vi_text(d6_k1_d_1,"Không gắn biển báo hiệu ở phía trước xe kéo, phía sau xe được kéo").

rule(d6_k1_d_2).
rule_type(d6_k1_d_2,primary_violation).
article(d6_k1_d_2,6).
clause(d6_k1_d_2,1).
point(d6_k1_d_2,"d").
subject(d6_k1_d_2,car).
action(d6_k1_d_2,dieu_khien_vehicle_keo_ro_mooc_no_co_sign_signal_signal_theo_quy_dinh).
fine_min(d6_k1_d_2,400000).
fine_max(d6_k1_d_2,600000).
original_vi_text(d6_k1_d_2,"điều khiển xe kéo rơ moóc không có biển báo hiệu theo quy định").

rule(d6_k1_dd).
rule_type(d6_k1_dd,primary_violation).
article(d6_k1_dd,6).
clause(d6_k1_dd,1).
point(d6_k1_dd,"dd").
subject(d6_k1_dd,car).
action(d6_k1_dd,use_horn_at_night_in_residential_or_hospital_zone).
context(d6_k1_dd,residential_area).
context(d6_k1_dd,hospital_zone).
context(d6_k1_dd,time_22_to_05).
fine_min(d6_k1_dd,400000).
fine_max(d6_k1_dd,600000).
original_vi_text(d6_k1_dd,"Sử dụng còi trong thời gian từ 22 giờ ngày hôm trước đến 05 giờ ngày hôm sau trong khu đông dân cư, khu vực cơ sở khám bệnh, chữa bệnh").

rule(d6_k2_a).
rule_type(d6_k2_a,primary_violation).
article(d6_k2_a,6).
clause(d6_k2_a,2).
point(d6_k2_a,"a").
subject(d6_k2_a,car).
action(d6_k2_a,illegal_lane_change_or_no_signal).
exception_ref(d6_k2_a,6,5,"g").
fine_min(d6_k2_a,600000).
fine_max(d6_k2_a,800000).
original_vi_text(d6_k2_a,"Chuyển làn đường không đúng nơi cho phép hoặc không có tín hiệu báo trước hoặc chuyển làn đường không đúng quy định \"mỗi lần chuyển làn đường chỉ được phép chuyển sang một làn đường liền kề\"").

rule(d6_k2_b).
rule_type(d6_k2_b,primary_violation).
article(d6_k2_b,6).
clause(d6_k2_b,2).
point(d6_k2_b,"b").
subject(d6_k2_b,car).
action(d6_k2_b,cho_nguoi_tren_buong_lai_qua_so_luong_quy_dinh).
fine_min(d6_k2_b,600000).
fine_max(d6_k2_b,800000).
original_vi_text(d6_k2_b,"Chở người trên buồng lái quá số lượng quy định").

rule(d6_k2_c).
rule_type(d6_k2_c,primary_violation).
article(d6_k2_c,6).
clause(d6_k2_c,2).
point(d6_k2_c,"c").
subject(d6_k2_c,car).
action(d6_k2_c,no_tuan_thu_cac_quy_dinh_ve_yield_road_tai_noi_road_bo_traffic).
context(d6_k2_c,intersection).
exception_ref(d6_k2_c,6,5,"n").
exception_ref(d6_k2_c,6,5,"o").
fine_min(d6_k2_c,600000).
fine_max(d6_k2_c,800000).
original_vi_text(d6_k2_c,"Không tuân thủ các quy định về nhường đường tại nơi đường bộ giao nhau").

rule(d6_k2_d_1).
rule_type(d6_k2_d_1,primary_violation).
article(d6_k2_d_1,6).
clause(d6_k2_d_1,2).
point(d6_k2_d_1,"d").
subject(d6_k2_d_1,car).
action(d6_k2_d_1,stop_vehicle_level_vehicle_tren_phan_road_vehicle_chay_car_doan_road_ngoai_level).
context(d6_k2_d_1,roadway).
fine_min(d6_k2_d_1,600000).
fine_max(d6_k2_d_1,800000).
original_vi_text(d6_k2_d_1,"Dừng xe, đỗ xe trên phần đường xe chạy ở đoạn đường ngoài đô thị nơi có lề đường rộng").

rule(d6_k2_d_2).
rule_type(d6_k2_d_2,primary_violation).
article(d6_k2_d_2,6).
clause(d6_k2_d_2,2).
point(d6_k2_d_2,"d").
subject(d6_k2_d_2,car).
action(d6_k2_d_2,stop_vehicle_level_vehicle_no_close_edge_road_phia_ben_right_theo_beam_go).
fine_min(d6_k2_d_2,600000).
fine_max(d6_k2_d_2,800000).
original_vi_text(d6_k2_d_2,"dừng xe, đỗ xe không sát mép đường phía bên phải theo chiều đi ở nơi đường có lề đường hẹp hoặc không có lề đường").

rule(d6_k2_d_3).
rule_type(d6_k2_d_3,primary_violation).
article(d6_k2_d_3,6).
clause(d6_k2_d_3,2).
point(d6_k2_d_3,"d").
subject(d6_k2_d_3,car).
action(d6_k2_d_3,stop_vehicle_level_vehicle_wrong_voi_beam_luu_traffic_cua_lane_road).
fine_min(d6_k2_d_3,600000).
fine_max(d6_k2_d_3,800000).
original_vi_text(d6_k2_d_3,"dừng xe, đỗ xe ngược với chiều lưu thông của làn đường").

rule(d6_k2_d_4).
rule_type(d6_k2_d_4,primary_violation).
article(d6_k2_d_4,6).
clause(d6_k2_d_4,2).
point(d6_k2_d_4,"d").
subject(d6_k2_d_4,car).
action(d6_k2_d_4,stop_vehicle_level_vehicle_tren_belt_phan_cach_co_dinh_car_giua_hai_phan).
fine_min(d6_k2_d_4,600000).
fine_max(d6_k2_d_4,800000).
original_vi_text(d6_k2_d_4,"dừng xe, đỗ xe trên dải phân cách cố định ở giữa hai phần đường xe chạy").

rule(d6_k2_d_5).
rule_type(d6_k2_d_5,primary_violation).
article(d6_k2_d_5,6).
clause(d6_k2_d_5,2).
point(d6_k2_d_5,"d").
subject(d6_k2_d_5,car).
action(d6_k2_d_5,level_vehicle_tren_doc_no_chen_banh).
fine_min(d6_k2_d_5,600000).
fine_max(d6_k2_d_5,800000).
original_vi_text(d6_k2_d_5,"đỗ xe trên dốc không chèn bánh").

rule(d6_k2_dd_1).
rule_type(d6_k2_dd_1,primary_violation).
article(d6_k2_dd_1,6).
clause(d6_k2_dd_1,2).
point(d6_k2_dd_1,"dd").
subject(d6_k2_dd_1,car).
action(d6_k2_dd_1,stop_vehicle_no_close_theo_le_road_sidewalk_sidewalk_phia_ben_right_theo_beam).
exception_ref(d6_k2_dd_1,6,4,"dd").
exception_ref(d6_k2_dd_1,6,4,"c").
fine_min(d6_k2_dd_1,600000).
fine_max(d6_k2_dd_1,800000).
original_vi_text(d6_k2_dd_1,"Dừng xe không sát theo lề đường, vỉa hè phía bên phải theo chiều đi hoặc bánh xe gần nhất cách lề đường, vỉa hè quá 0,25 mét").

rule(d6_k2_dd_2).
rule_type(d6_k2_dd_2,primary_violation).
article(d6_k2_dd_2,6).
clause(d6_k2_dd_2,2).
point(d6_k2_dd_2,"dd").
subject(d6_k2_dd_2,car).
action(d6_k2_dd_2,stop_vehicle_tren_road_danh_rieng_cho_vehicle_buyt).
context(d6_k2_dd_2,bus_lane).
exception_ref(d6_k2_dd_2,6,4,"dd").
exception_ref(d6_k2_dd_2,6,4,"c").
fine_min(d6_k2_dd_2,600000).
fine_max(d6_k2_dd_2,800000).
original_vi_text(d6_k2_dd_2,"dừng xe trên đường dành riêng cho xe buýt").

rule(d6_k2_dd_3).
rule_type(d6_k2_dd_3,primary_violation).
article(d6_k2_dd_3,6).
clause(d6_k2_dd_3,2).
point(d6_k2_dd_3,"dd").
subject(d6_k2_dd_3,car).
action(d6_k2_dd_3,stop_vehicle_tren_mieng_cong_thoat_nuoc_mieng_tunnel_cua_road_dien_thoai_dien).
exception_ref(d6_k2_dd_3,6,4,"dd").
exception_ref(d6_k2_dd_3,6,4,"c").
fine_min(d6_k2_dd_3,600000).
fine_max(d6_k2_dd_3,800000).
original_vi_text(d6_k2_dd_3,"dừng xe trên miệng cống thoát nước, miệng hầm của đường điện thoại, điện cao thế, chỗ dành riêng cho xe chữa cháy lấy nước").

rule(d6_k2_dd_4).
rule_type(d6_k2_dd_4,primary_violation).
article(d6_k2_dd_4,6).
clause(d6_k2_dd_4,2).
point(d6_k2_dd_4,"dd").
subject(d6_k2_dd_4,car).
action(d6_k2_dd_4,roi_vi_tri_lai_tat_machine_khi_stop_vehicle).
exception_ref(d6_k2_dd_4,6,4,"dd").
exception_ref(d6_k2_dd_4,6,4,"c").
fine_min(d6_k2_dd_4,600000).
fine_max(d6_k2_dd_4,800000).
original_vi_text(d6_k2_dd_4,"rời vị trí lái, tắt máy khi dừng xe (").

rule(d6_k3_a).
rule_type(d6_k3_a,primary_violation).
article(d6_k3_a,6).
clause(d6_k3_a,3).
point(d6_k3_a,"a").
subject(d6_k3_a,car).
action(d6_k3_a,speed_over_limit_5_to_under_10).
fine_min(d6_k3_a,800000).
fine_max(d6_k3_a,1000000).
original_vi_text(d6_k3_a,"Điều khiển xe chạy quá tốc độ quy định từ 05 km/h đến dưới 10 km/h").

rule(d6_k3_b_1).
rule_type(d6_k3_b_1,primary_violation).
article(d6_k3_b_1,6).
clause(d6_k3_b_1,3).
point(d6_k3_b_1,"b").
subject(d6_k3_b_1,car).
action(d6_k3_b_1,use_horn_or_rev_engine_continuously).
fine_min(d6_k3_b_1,800000).
fine_max(d6_k3_b_1,1000000).
original_vi_text(d6_k3_b_1,"Sử dụng còi, rú ga liên tục").

rule(d6_k3_b_2).
rule_type(d6_k3_b_2,primary_violation).
article(d6_k3_b_2,6).
clause(d6_k3_b_2,3).
point(d6_k3_b_2,"b").
subject(d6_k3_b_2,car).
action(d6_k3_b_2,use_stop_horn_hoi_use_stop_light_beam_high_khi_gap_nguoi_go_bo).
fine_min(d6_k3_b_2,800000).
fine_max(d6_k3_b_2,1000000).
original_vi_text(d6_k3_b_2,"sử dụng còi hơi, sử dụng đèn chiếu xa khi gặp người đi bộ qua đường hoặc khi đi trên đoạn đường qua khu dân cư có hệ thống chiếu sáng đang hoạt động hoặc khi gặp xe đi ngược chiều (").

rule(d6_k3_c).
rule_type(d6_k3_c,primary_violation).
article(d6_k3_c,6).
clause(d6_k3_c,3).
point(d6_k3_c,"c").
subject(d6_k3_c,car).
action(d6_k3_c,change_turn_no_quan_close_hoac_no_signal_dam_khoang_cach_safe_safety_voi).
fine_min(d6_k3_c,800000).
fine_max(d6_k3_c,1000000).
original_vi_text(d6_k3_c,"Chuyển hướng không quan sát hoặc không bảo đảm khoảng cách an toàn với xe phía sau hoặc không giảm tốc độ hoặc không có tín hiệu báo hướng rẽ hoặc có tín hiệu báo hướng rẽ nhưng không sử dụng liên tục trong quá trình chuyển hướng (").

rule(d6_k3_d_1).
rule_type(d6_k3_d_1,primary_violation).
article(d6_k3_d_1,6).
clause(d6_k3_d_1,3).
point(d6_k3_d_1,"d").
subject(d6_k3_d_1,car).
action(d6_k3_d_1,no_tuan_thu_cac_quy_dinh_ve_stop_vehicle_level_vehicle_tai_noi_road).
context(d6_k3_d_1,intersection).
context(d6_k3_d_1,railway_crossing).
fine_min(d6_k3_d_1,800000).
fine_max(d6_k3_d_1,1000000).
original_vi_text(d6_k3_d_1,"Không tuân thủ các quy định về dừng xe, đỗ xe tại nơi đường bộ giao nhau cùng mức với đường sắt").

rule(d6_k3_d_2).
rule_type(d6_k3_d_2,primary_violation).
article(d6_k3_d_2,6).
clause(d6_k3_d_2,3).
point(d6_k3_d_2,"d").
subject(d6_k3_d_2,car).
action(d6_k3_d_2,stop_vehicle_level_vehicle_trong_pham_vi_signal_ve_cong_trinh_road_close_pham).
fine_min(d6_k3_d_2,800000).
fine_max(d6_k3_d_2,1000000).
original_vi_text(d6_k3_d_2,"dừng xe, đỗ xe trong phạm vi bảo vệ công trình đường sắt, phạm vi an toàn của đường sắt").

rule(d6_k3_dd_1).
rule_type(d6_k3_dd_1,primary_violation).
article(d6_k3_dd_1,6).
clause(d6_k3_dd_1,3).
point(d6_k3_dd_1,"dd").
subject(d6_k3_dd_1,car).
action(d6_k3_dd_1,stop_vehicle_level_vehicle_tai_vi_tri_noi_road_bo_traffic_nhau_hoac_trong).
context(d6_k3_dd_1,within_5m_of_intersection).
fine_min(d6_k3_dd_1,800000).
fine_max(d6_k3_dd_1,1000000).
original_vi_text(d6_k3_dd_1,"Dừng xe, đỗ xe tại vị trí: nơi đường bộ giao nhau hoặc trong phạm vi 05 mét tính từ mép đường giao nhau").

rule(d6_k3_dd_2).
rule_type(d6_k3_dd_2,primary_violation).
article(d6_k3_dd_2,6).
clause(d6_k3_dd_2,3).
point(d6_k3_dd_2,"dd").
subject(d6_k3_dd_2,car).
action(d6_k3_dd_2,diem_don_tra_khach).
fine_min(d6_k3_dd_2,800000).
fine_max(d6_k3_dd_2,1000000).
original_vi_text(d6_k3_dd_2,"điểm đón, trả khách").

rule(d6_k3_dd_3).
rule_type(d6_k3_dd_3,primary_violation).
article(d6_k3_dd_3,6).
clause(d6_k3_dd_3,3).
point(d6_k3_dd_3,"dd").
subject(d6_k3_dd_3,car).
action(d6_k3_dd_3,truoc_cong_hoac_trong_pham_vi_05_met_hai_ben_cong_tru_so_co).
fine_min(d6_k3_dd_3,800000).
fine_max(d6_k3_dd_3,1000000).
original_vi_text(d6_k3_dd_3,"trước cổng hoặc trong phạm vi 05 mét hai bên cổng trụ sở cơ quan, tổ chức có bố trí đường cho xe ra, vào").

rule(d6_k3_dd_4).
rule_type(d6_k3_dd_4,primary_violation).
article(d6_k3_dd_4,6).
clause(d6_k3_dd_4,3).
point(d6_k3_dd_4,"dd").
subject(d6_k3_dd_4,car).
action(d6_k3_dd_4,noi_phan_road_co_be_rong_instruction_du_cho_mot_lane_vehicle_co_gioi).
fine_min(d6_k3_dd_4,800000).
fine_max(d6_k3_dd_4,1000000).
original_vi_text(d6_k3_dd_4,"nơi phần đường có bề rộng chỉ đủ cho một làn xe cơ giới").

rule(d6_k3_dd_5).
rule_type(d6_k3_dd_5,primary_violation).
article(d6_k3_dd_5,6).
clause(d6_k3_dd_5,3).
point(d6_k3_dd_5,"dd").
subject(d6_k3_dd_5,car).
action(d6_k3_dd_5,che_khuat_sign_signal_signal_road_bo_light_tin_signal_traffic_traffic).
fine_min(d6_k3_dd_5,800000).
fine_max(d6_k3_dd_5,1000000).
original_vi_text(d6_k3_dd_5,"che khuất biển báo hiệu đường bộ, đèn tín hiệu giao thông").

rule(d6_k3_dd_6).
rule_type(d6_k3_dd_6,primary_violation).
article(d6_k3_dd_6,6).
clause(d6_k3_dd_6,3).
point(d6_k3_dd_6,"dd").
subject(d6_k3_dd_6,car).
action(d6_k3_dd_6,noi_motor_belt_phan_cach_giua).
fine_min(d6_k3_dd_6,800000).
fine_max(d6_k3_dd_6,1000000).
original_vi_text(d6_k3_dd_6,"nơi mở dải phân cách giữa").

rule(d6_k3_dd_7).
rule_type(d6_k3_dd_7,primary_violation).
article(d6_k3_dd_7,6).
clause(d6_k3_dd_7,3).
point(d6_k3_dd_7,"dd").
subject(d6_k3_dd_7,car).
action(d6_k3_dd_7,cach_vehicle_car_car_dang_level_wrong_beam_duoi_20_met_tren_road_pho).
fine_min(d6_k3_dd_7,800000).
fine_max(d6_k3_dd_7,1000000).
original_vi_text(d6_k3_dd_7,"cách xe ô tô đang đỗ ngược chiều dưới 20 mét trên đường phố hẹp, dưới 40 mét trên đường có một làn xe cơ giới trên một chiều đường").

rule(d6_k3_e_1).
rule_type(d6_k3_e_1,primary_violation).
article(d6_k3_e_1,6).
clause(d6_k3_e_1,3).
point(d6_k3_e_1,"e").
subject(d6_k3_e_1,car).
action(d6_k3_e_1,level_vehicle_no_close_theo_le_road_sidewalk_sidewalk_phia_ben_right_theo_beam).
exception_ref(d6_k3_e_1,6,4,"dd").
exception_ref(d6_k3_e_1,6,4,"c").
fine_min(d6_k3_e_1,800000).
fine_max(d6_k3_e_1,1000000).
original_vi_text(d6_k3_e_1,"Đỗ xe không sát theo lề đường, vỉa hè phía bên phải theo chiều đi hoặc bánh xe gần nhất cách lề đường, vỉa hè quá 0,25 mét").

rule(d6_k3_e_2).
rule_type(d6_k3_e_2,primary_violation).
article(d6_k3_e_2,6).
clause(d6_k3_e_2,3).
point(d6_k3_e_2,"e").
subject(d6_k3_e_2,car).
action(d6_k3_e_2,level_vehicle_tren_road_danh_rieng_cho_vehicle_buyt).
context(d6_k3_e_2,bus_lane).
exception_ref(d6_k3_e_2,6,4,"dd").
exception_ref(d6_k3_e_2,6,4,"c").
fine_min(d6_k3_e_2,800000).
fine_max(d6_k3_e_2,1000000).
original_vi_text(d6_k3_e_2,"đỗ xe trên đường dành riêng cho xe buýt").

rule(d6_k3_e_3).
rule_type(d6_k3_e_3,primary_violation).
article(d6_k3_e_3,6).
clause(d6_k3_e_3,3).
point(d6_k3_e_3,"e").
subject(d6_k3_e_3,car).
action(d6_k3_e_3,level_vehicle_tren_mieng_cong_thoat_nuoc_mieng_tunnel_cua_road_dien_thoai_dien).
exception_ref(d6_k3_e_3,6,4,"dd").
exception_ref(d6_k3_e_3,6,4,"c").
fine_min(d6_k3_e_3,800000).
fine_max(d6_k3_e_3,1000000).
original_vi_text(d6_k3_e_3,"đỗ xe trên miệng cống thoát nước, miệng hầm của đường điện thoại, điện cao thế, chỗ dành riêng cho xe chữa cháy lấy nước").

rule(d6_k3_e_4).
rule_type(d6_k3_e_4,primary_violation).
article(d6_k3_e_4,6).
clause(d6_k3_e_4,3).
point(d6_k3_e_4,"e").
subject(d6_k3_e_4,car).
action(d6_k3_e_4,level_de_vehicle_car_sidewalk_sidewalk_left_quy_dinh_cua_phap_luat).
exception_ref(d6_k3_e_4,6,4,"dd").
exception_ref(d6_k3_e_4,6,4,"c").
fine_min(d6_k3_e_4,800000).
fine_max(d6_k3_e_4,1000000).
original_vi_text(d6_k3_e_4,"đỗ, để xe ở vỉa hè trái quy định của pháp luật").

rule(d6_k3_e_5).
rule_type(d6_k3_e_5,primary_violation).
article(d6_k3_e_5,6).
clause(d6_k3_e_5,3).
point(d6_k3_e_5,"e").
subject(d6_k3_e_5,car).
action(d6_k3_e_5,level_vehicle_noi_co_sign_prohibited_level_vehicle_hoac_sign_prohibited_stop_vehicle_va).
exception_ref(d6_k3_e_5,6,4,"dd").
exception_ref(d6_k3_e_5,6,4,"c").
fine_min(d6_k3_e_5,800000).
fine_max(d6_k3_e_5,1000000).
original_vi_text(d6_k3_e_5,"đỗ xe nơi có biển \"Cấm đỗ xe\" hoặc biển \"Cấm dừng xe và đỗ xe\"").

rule(d6_k3_g).
rule_type(d6_k3_g,primary_violation).
article(d6_k3_g,6).
clause(d6_k3_g,3).
point(d6_k3_g,"g").
subject(d6_k3_g,car).
action(d6_k3_g,no_use_stop_hoac_use_stop_no_du_light_beam_sang_trong_thoi_gian).
context(d6_k3_g,time_18_to_06).
fine_min(d6_k3_g,800000).
fine_max(d6_k3_g,1000000).
original_vi_text(d6_k3_g,"Không sử dụng hoặc sử dụng không đủ đèn chiếu sáng trong thời gian từ 18 giờ ngày hôm trước đến 06 giờ ngày hôm sau hoặc khi có sương mù, khói, bụi, trời mưa, thời tiết xấu làm hạn chế tầm nhìn").

rule(d6_k3_h).
rule_type(d6_k3_h,primary_violation).
article(d6_k3_h,6).
clause(d6_k3_h,3).
point(d6_k3_h,"h").
subject(d6_k3_h,car).
action(d6_k3_h,dieu_khien_vehicle_car_car_keo_theo_vehicle_khac_vat_khac).
fine_min(d6_k3_h,800000).
fine_max(d6_k3_h,1000000).
original_vi_text(d6_k3_h,"Điều khiển xe ô tô kéo theo xe khác, vật khác (").

rule(d6_k3_i).
rule_type(d6_k3_i,primary_violation).
article(d6_k3_i,6).
clause(d6_k3_i,3).
point(d6_k3_i,"i").
subject(d6_k3_i,car).
action(d6_k3_i,cho_nguoi_tren_vehicle_duoc_keo).
fine_min(d6_k3_i,800000).
fine_max(d6_k3_i,1000000).
original_vi_text(d6_k3_i,"Chở người trên xe được kéo").

rule(d6_k3_k).
rule_type(d6_k3_k,primary_violation).
article(d6_k3_k,6).
clause(d6_k3_k,3).
point(d6_k3_k,"k").
subject(d6_k3_k,car).
action(d6_k3_k,driver_no_seatbelt).
fine_min(d6_k3_k,800000).
fine_max(d6_k3_k,1000000).
original_vi_text(d6_k3_k,"Không thắt dây đai an toàn khi điều khiển xe chạy trên đường").

rule(d6_k3_l).
rule_type(d6_k3_l,primary_violation).
article(d6_k3_l,6).
clause(d6_k3_l,3).
point(d6_k3_l,"l").
subject(d6_k3_l,car).
action(d6_k3_l,no_seatbelt).
fine_min(d6_k3_l,800000).
fine_max(d6_k3_l,1000000).
original_vi_text(d6_k3_l,"Chở người trên xe ô tô không thắt dây đai an toàn (tại vị trí có trang bị dây đai an toàn) khi xe đang chạy").

rule(d6_k3_m).
rule_type(d6_k3_m,primary_violation).
article(d6_k3_m,6).
clause(d6_k3_m,3).
point(d6_k3_m,"m").
subject(d6_k3_m,car).
action(d6_k3_m,cho_child_child_duoi_10_tuoi_va_beam_highway_duoi_1_35_met_tren).
fine_min(d6_k3_m,800000).
fine_max(d6_k3_m,1000000).
original_vi_text(d6_k3_m,"Chở trẻ em dưới 10 tuổi và chiều cao dưới 1,35 mét trên xe ô tô ngồi cùng hàng ghế với người lái xe (").

rule(d6_k3_n).
rule_type(d6_k3_n,primary_violation).
article(d6_k3_n,6).
clause(d6_k3_n,3).
point(d6_k3_n,"n").
subject(d6_k3_n,car).
action(d6_k3_n,chay_trong_tunnel_road_bo_no_use_stop_light_beam_sang_near).
context(d6_k3_n,tunnel).
fine_min(d6_k3_n,800000).
fine_max(d6_k3_n,1000000).
original_vi_text(d6_k3_n,"Chạy trong hầm đường bộ không sử dụng đèn chiếu sáng gần").

rule(d6_k3_o).
rule_type(d6_k3_o,primary_violation).
article(d6_k3_o,6).
clause(d6_k3_o,3).
point(d6_k3_o,"o").
subject(d6_k3_o,car).
action(d6_k3_o,dieu_khien_vehicle_chay_duoi_speed_level_toi_thieu_tren_doan_road_bo_co).
fine_min(d6_k3_o,800000).
fine_max(d6_k3_o,1000000).
original_vi_text(d6_k3_o,"Điều khiển xe chạy dưới tốc độ tối thiểu trên đoạn đường bộ có quy định tốc độ tối thiểu cho phép").

rule(d6_k3_p).
rule_type(d6_k3_p,primary_violation).
article(d6_k3_p,6).
clause(d6_k3_p,3).
point(d6_k3_p,"p").
subject(d6_k3_p,car).
action(d6_k3_p,dieu_khien_vehicle_chay_speed_level_thap_hon_cac_vehicle_khac_go_cung_beam).
fine_min(d6_k3_p,800000).
fine_max(d6_k3_p,1000000).
original_vi_text(d6_k3_p,"Điều khiển xe chạy tốc độ thấp hơn các xe khác đi cùng chiều mà không đi về làn đường bên phải chiều đi của mình").

rule(d6_k4_a).
rule_type(d6_k4_a,primary_violation).
article(d6_k4_a,6).
clause(d6_k4_a,4).
point(d6_k4_a,"a").
subject(d6_k4_a,car).
action(d6_k4_a,dieu_khien_vehicle_no_du_dieu_kien_de_thu_phi_theo_hinh_thuc_dien).
fine_min(d6_k4_a,2000000).
fine_max(d6_k4_a,3000000).
original_vi_text(d6_k4_a,"Điều khiển xe không đủ điều kiện để thu phí theo hình thức điện tử tự động không dừng (xe không gắn thẻ đầu cuối) đi vào làn đường dành riêng thu phí theo hình thức điện tử tự động không dừng tại các trạm thu phí").

rule(d6_k4_b_1).
rule_type(d6_k4_b_1,primary_violation).
article(d6_k4_b_1,6).
clause(d6_k4_b_1,4).
point(d6_k4_b_1,"b").
subject(d6_k4_b_1,car).
action(d6_k4_b_1,stop_vehicle_level_vehicle_tai_vi_tri_ben_left_road_mot_beam_hoac_ben).
exception_ref(d6_k4_b_1,6,7,"c").
fine_min(d6_k4_b_1,2000000).
fine_max(d6_k4_b_1,3000000).
original_vi_text(d6_k4_b_1,"Dừng xe, đỗ xe tại vị trí: bên trái đường một chiều hoặc bên trái (theo hướng lưu thông) của đường đôi").

rule(d6_k4_b_2).
rule_type(d6_k4_b_2,primary_violation).
article(d6_k4_b_2,6).
clause(d6_k4_b_2,4).
point(d6_k4_b_2,"b").
subject(d6_k4_b_2,car).
action(d6_k4_b_2,tren_doan_road_cong_hoac_near_turn_doc_noi_tam_nhin_bi_che_khuat).
exception_ref(d6_k4_b_2,6,7,"c").
fine_min(d6_k4_b_2,2000000).
fine_max(d6_k4_b_2,3000000).
original_vi_text(d6_k4_b_2,"trên đoạn đường cong hoặc gần đầu dốc nơi tầm nhìn bị che khuất").

rule(d6_k4_b_3).
rule_type(d6_k4_b_3,primary_violation).
article(d6_k4_b_3,6).
clause(d6_k4_b_3,4).
point(d6_k4_b_3,"b").
subject(d6_k4_b_3,car).
action(d6_k4_b_3,tren_bridge).
context(d6_k4_b_3,bridge).
exception_ref(d6_k4_b_3,6,7,"c").
fine_min(d6_k4_b_3,2000000).
fine_max(d6_k4_b_3,3000000).
original_vi_text(d6_k4_b_3,"trên cầu (").

rule(d6_k4_c).
rule_type(d6_k4_c,primary_violation).
article(d6_k4_c,6).
clause(d6_k4_c,4).
point(d6_k4_c,"c").
subject(d6_k4_c,car).
action(d6_k4_c,no_thuc_hien_sign_phap_signal_dam_safe_safety_theo_quy_dinh_khi_vehicle).
context(d6_k4_c,intersection).
context(d6_k4_c,railway_crossing).
fine_min(d6_k4_c,2000000).
fine_max(d6_k4_c,3000000).
original_vi_text(d6_k4_c,"Không thực hiện biện pháp bảo đảm an toàn theo quy định khi xe ô tô bị hư hỏng ngay tại nơi đường bộ giao nhau cùng mức với đường sắt").

rule(d6_k4_d).
rule_type(d6_k4_d,primary_violation).
article(d6_k4_d,6).
clause(d6_k4_d,4).
point(d6_k4_d,"d").
subject(d6_k4_d,car).
action(d6_k4_d,no_yield_road_cho_vehicle_xin_overtake_khi_co_du_dieu_kien_safe_safety).
fine_min(d6_k4_d,2000000).
fine_max(d6_k4_d,3000000).
original_vi_text(d6_k4_d,"Không nhường đường cho xe xin vượt khi có đủ điều kiện an toàn").

rule(d6_k4_dd_1).
rule_type(d6_k4_dd_1,primary_violation).
article(d6_k4_dd_1,6).
clause(d6_k4_dd_1,4).
point(d6_k4_dd_1,"dd").
subject(d6_k4_dd_1,car).
action(d6_k4_dd_1,uturn_in_tunnel).
context(d6_k4_dd_1,tunnel).
fine_min(d6_k4_dd_1,2000000).
fine_max(d6_k4_dd_1,3000000).
original_vi_text(d6_k4_dd_1,"Lùi xe, quay đầu xe trong hầm đường bộ").

rule(d6_k4_dd_2).
rule_type(d6_k4_dd_2,primary_violation).
article(d6_k4_dd_2,6).
clause(d6_k4_dd_2,4).
point(d6_k4_dd_2,"dd").
subject(d6_k4_dd_2,car).
action(d6_k4_dd_2,stop_or_park_improperly_in_tunnel).
context(d6_k4_dd_2,tunnel).
fine_min(d6_k4_dd_2,2000000).
fine_max(d6_k4_dd_2,3000000).
original_vi_text(d6_k4_dd_2,"dừng xe, đỗ xe trong hầm đường bộ không đúng nơi quy định").

rule(d6_k4_dd_3).
rule_type(d6_k4_dd_3,primary_violation).
article(d6_k4_dd_3,6).
clause(d6_k4_dd_3,4).
point(d6_k4_dd_3,"dd").
subject(d6_k4_dd_3,car).
action(d6_k4_dd_3,no_co_signal_signal_bang_light_emergency_emergency_no_dat_sign_canh_signal_chu).
context(d6_k4_dd_3,tunnel).
fine_min(d6_k4_dd_3,2000000).
fine_max(d6_k4_dd_3,3000000).
original_vi_text(d6_k4_dd_3,"không có báo hiệu bằng đèn khẩn cấp, không đặt biển cảnh báo \"Chú ý xe đỗ\" (hoặc đèn cảnh báo) về phía sau xe khoảng cách đảm bảo an toàn khi dừng xe, đỗ xe trong hầm đường bộ trong trường hợp gặp sự cố kỹ thuật hoặc bất khả kháng khác buộc phải dừng xe, đỗ xe").

rule(d6_k4_e_1).
rule_type(d6_k4_e_1,primary_violation).
article(d6_k4_e_1,6).
clause(d6_k4_e_1,4).
point(d6_k4_e_1,"e").
subject(d6_k4_e_1,car).
action(d6_k4_e_1,reverse_vehicle_car_road_mot_beam_road_co_sign_prohibited_go_wrong_beam_khu).
context(d6_k4_e_1,pedestrian_crossing).
exception_ref(d6_k4_e_1,6,11,"dd").
fine_min(d6_k4_e_1,2000000).
fine_max(d6_k4_e_1,3000000).
original_vi_text(d6_k4_e_1,"Lùi xe ở đường một chiều, đường có biển \"Cấm đi ngược chiều\", khu vực cấm dừng, trên phần đường dành cho người đi bộ qua đường, nơi đường bộ giao nhau, nơi đường bộ giao nhau cùng mức với đường sắt, nơi tầm nhìn bị che khuất").

rule(d6_k4_e_2).
rule_type(d6_k4_e_2,primary_violation).
article(d6_k4_e_2,6).
clause(d6_k4_e_2,4).
point(d6_k4_e_2,"e").
subject(d6_k4_e_2,car).
action(d6_k4_e_2,reverse_vehicle_no_quan_close_hai_ben_phia_sau_vehicle_hoac_no_co_tin).
exception_ref(d6_k4_e_2,6,11,"dd").
fine_min(d6_k4_e_2,2000000).
fine_max(d6_k4_e_2,3000000).
original_vi_text(d6_k4_e_2,"lùi xe không quan sát hai bên, phía sau xe hoặc không có tín hiệu lùi xe").

rule(d6_k4_g).
rule_type(d6_k4_g,primary_violation).
article(d6_k4_g,6).
clause(d6_k4_g,4).
point(d6_k4_g,"g").
subject(d6_k4_g,car).
action(d6_k4_g,dieu_khien_vehicle_co_lien_quan_truc_tiep_light_vu_tai_nan_traffic_traffic).
exception_ref(d6_k4_g,6,8,"all").
fine_min(d6_k4_g,2000000).
fine_max(d6_k4_g,3000000).
original_vi_text(d6_k4_g,"Điều khiển xe có liên quan trực tiếp đến vụ tai nạn giao thông mà không dừng ngay phương tiện, không giữ nguyên hiện trường, không trợ giúp người bị nạn").

rule(d6_k4_h).
rule_type(d6_k4_h,primary_violation).
article(d6_k4_h,6).
clause(d6_k4_h,4).
point(d6_k4_h,"h").
subject(d6_k4_h,car).
action(d6_k4_h,vehicle_duoc_quyen_priority_priority_lap_dat_use_stop_thiet_bi_phat_tin_signal).
fine_min(d6_k4_h,2000000).
fine_max(d6_k4_h,3000000).
original_vi_text(d6_k4_h,"Xe được quyền ưu tiên lắp đặt, sử dụng thiết bị phát tín hiệu ưu tiên không đúng quy định hoặc sử dụng thiết bị phát tín hiệu ưu tiên mà không có giấy phép của cơ quan có thẩm quyền cấp hoặc có giấy phép của cơ quan có thẩm quyền cấp nhưng không còn giá trị sử dụng theo quy định").

rule(d6_k4_i).
rule_type(d6_k4_i,primary_violation).
article(d6_k4_i,6).
clause(d6_k4_i,4).
point(d6_k4_i,"i").
subject(d6_k4_i,car).
action(d6_k4_i,u_turn_turn_vehicle_car_phan_road_danh_cho_nguoi_go_bo_qua_road_tren).
context(d6_k4_i,intersection).
context(d6_k4_i,railway_crossing).
context(d6_k4_i,one_way_road).
context(d6_k4_i,bridge).
fine_min(d6_k4_i,2000000).
fine_max(d6_k4_i,3000000).
original_vi_text(d6_k4_i,"Quay đầu xe ở phần đường dành cho người đi bộ qua đường, trên cầu, đầu cầu, gầm cầu vượt, ngầm, tại nơi đường bộ giao nhau cùng mức với đường sắt, đường hẹp, đường dốc, đoạn đường cong tầm nhìn bị che khuất, trên đường một chiều").

rule(d6_k4_k_1).
rule_type(d6_k4_k_1,primary_violation).
article(d6_k4_k_1,6).
clause(d6_k4_k_1,4).
point(d6_k4_k_1,"k").
subject(d6_k4_k_1,car).
action(d6_k4_k_1,u_turn_turn_vehicle_tai_noi_co_sign_signal_signal_co_noi_stop_prohibited_u_turn).
fine_min(d6_k4_k_1,2000000).
fine_max(d6_k4_k_1,3000000).
original_vi_text(d6_k4_k_1,"Quay đầu xe tại nơi có biển báo hiệu có nội dung cấm quay đầu đối với loại phương tiện đang điều khiển").

rule(d6_k4_k_2).
rule_type(d6_k4_k_2,primary_violation).
article(d6_k4_k_2,6).
clause(d6_k4_k_2,4).
point(d6_k4_k_2,"k").
subject(d6_k4_k_2,car).
action(d6_k4_k_2,dieu_khien_vehicle_turn_left_tai_noi_co_sign_signal_signal_co_noi_stop).
fine_min(d6_k4_k_2,2000000).
fine_max(d6_k4_k_2,3000000).
original_vi_text(d6_k4_k_2,"điều khiển xe rẽ trái tại nơi có biển báo hiệu có nội dung cấm rẽ trái đối với loại phương tiện đang điều khiển").

rule(d6_k4_k_3).
rule_type(d6_k4_k_3,primary_violation).
article(d6_k4_k_3,6).
clause(d6_k4_k_3,4).
point(d6_k4_k_3,"k").
subject(d6_k4_k_3,car).
action(d6_k4_k_3,dieu_khien_vehicle_turn_right_tai_noi_co_sign_signal_signal_co_noi_stop).
fine_min(d6_k4_k_3,2000000).
fine_max(d6_k4_k_3,3000000).
original_vi_text(d6_k4_k_3,"điều khiển xe rẽ phải tại nơi có biển báo hiệu có nội dung cấm rẽ phải đối với loại phương tiện đang điều khiển").

rule(d6_k4_l).
rule_type(d6_k4_l,primary_violation).
article(d6_k4_l,6).
clause(d6_k4_l,4).
point(d6_k4_l,"l").
subject(d6_k4_l,car).
action(d6_k4_l,no_giu_khoang_cach_safe_safety_de_xay_ra_va_cham_voi_vehicle_chay).
exception_ref(d6_k4_l,6,5,"d").
fine_min(d6_k4_l,2000000).
fine_max(d6_k4_l,3000000).
original_vi_text(d6_k4_l,"Không giữ khoảng cách an toàn để xảy ra va chạm với xe chạy liền trước hoặc không giữ khoảng cách theo quy định của biển báo hiệu \"Cự ly tối thiểu giữa hai xe\"").

rule(d6_k5_a_1).
rule_type(d6_k5_a_1,primary_violation).
article(d6_k5_a_1,6).
clause(d6_k5_a_1,5).
point(d6_k5_a_1,"a").
subject(d6_k5_a_1,car).
action(d6_k5_a_1,overtake_vehicle_trong_nhung_truong_hop_no_duoc_overtake_overtake_vehicle_tai_doan_road).
fine_min(d6_k5_a_1,4000000).
fine_max(d6_k5_a_1,6000000).
original_vi_text(d6_k5_a_1,"Vượt xe trong những trường hợp không được vượt, vượt xe tại đoạn đường có biển báo hiệu có nội dung cấm vượt (đối với loại phương tiện đang điều khiển)").

rule(d6_k5_a_2).
rule_type(d6_k5_a_2,primary_violation).
article(d6_k5_a_2,6).
clause(d6_k5_a_2,5).
point(d6_k5_a_2,"a").
subject(d6_k5_a_2,car).
action(d6_k5_a_2,overtake_without_proper_signal).
fine_min(d6_k5_a_2,4000000).
fine_max(d6_k5_a_2,6000000).
original_vi_text(d6_k5_a_2,"không có tín hiệu trước khi vượt hoặc có tín hiệu vượt xe nhưng không sử dụng trong suốt quá trình vượt xe").

rule(d6_k5_a_3).
rule_type(d6_k5_a_3,primary_violation).
article(d6_k5_a_3,6).
clause(d6_k5_a_3,5).
point(d6_k5_a_3,"a").
subject(d6_k5_a_3,car).
action(d6_k5_a_3,overtake_ben_right_vehicle_khac_trong_truong_hop_no_duoc_permit).
fine_min(d6_k5_a_3,4000000).
fine_max(d6_k5_a_3,6000000).
original_vi_text(d6_k5_a_3,"vượt bên phải xe khác trong trường hợp không được phép").

rule(d6_k5_b_1).
rule_type(d6_k5_b_1,primary_violation).
article(d6_k5_b_1,6).
clause(d6_k5_b_1,5).
point(d6_k5_b_1,"b").
subject(d6_k5_b_1,car).
action(d6_k5_b_1,dieu_khien_vehicle_no_go_ben_right_theo_beam_go_cua_minh).
exception_ref(d6_k5_b_1,6,4,"a").
fine_min(d6_k5_b_1,4000000).
fine_max(d6_k5_b_1,6000000).
original_vi_text(d6_k5_b_1,"Điều khiển xe không đi bên phải theo chiều đi của mình").

rule(d6_k5_b_2).
rule_type(d6_k5_b_2,primary_violation).
article(d6_k5_b_2,6).
clause(d6_k5_b_2,5).
point(d6_k5_b_2,"b").
subject(d6_k5_b_2,car).
action(d6_k5_b_2,go_no_stop_phan_road_hoac_lane_road_quy_dinh_lane_cung_beam_hoac).
exception_ref(d6_k5_b_2,6,4,"a").
fine_min(d6_k5_b_2,4000000).
fine_max(d6_k5_b_2,6000000).
original_vi_text(d6_k5_b_2,"đi không đúng phần đường hoặc làn đường quy định (làn cùng chiều hoặc làn ngược chiều)").

rule(d6_k5_c).
rule_type(d6_k5_c,primary_violation).
article(d6_k5_c,6).
clause(d6_k5_c,5).
point(d6_k5_c,"c").
subject(d6_k5_c,car).
action(d6_k5_c,tranh_vehicle_go_wrong_beam_no_stop_quy_dinh).
exception_ref(d6_k5_c,6,3,"b").
fine_min(d6_k5_c,4000000).
fine_max(d6_k5_c,6000000).
original_vi_text(d6_k5_c,"Tránh xe đi ngược chiều không đúng quy định (").

rule(d6_k5_d_1).
rule_type(d6_k5_d_1,primary_violation).
article(d6_k5_d_1,6).
clause(d6_k5_d_1,5).
point(d6_k5_d_1,"d").
subject(d6_k5_d_1,car).
action(d6_k5_d_1,no_tuan_thu_quy_dinh_khi_enter_hoac_ra_road_highway_speed).
fine_min(d6_k5_d_1,4000000).
fine_max(d6_k5_d_1,6000000).
original_vi_text(d6_k5_d_1,"Không tuân thủ quy định khi vào hoặc ra đường cao tốc").

rule(d6_k5_d_2).
rule_type(d6_k5_d_2,primary_violation).
article(d6_k5_d_2,6).
clause(d6_k5_d_2,5).
point(d6_k5_d_2,"d").
subject(d6_k5_d_2,car).
action(d6_k5_d_2,dieu_khien_vehicle_chay_car_lane_stop_vehicle_emergency_emergency_hoac_phan_le_road).
fine_min(d6_k5_d_2,4000000).
fine_max(d6_k5_d_2,6000000).
original_vi_text(d6_k5_d_2,"điều khiển xe chạy ở làn dừng xe khẩn cấp hoặc phần lề đường của đường cao tốc").

rule(d6_k5_d_3).
rule_type(d6_k5_d_3,primary_violation).
article(d6_k5_d_3,6).
clause(d6_k5_d_3,5).
point(d6_k5_d_3,"d").
subject(d6_k5_d_3,car).
action(d6_k5_d_3,no_tuan_thu_quy_dinh_ve_khoang_cach_safe_safety_doi_voi_vehicle_chay).
context(d6_k5_d_3,expressway).
fine_min(d6_k5_d_3,4000000).
fine_max(d6_k5_d_3,6000000).
original_vi_text(d6_k5_d_3,"không tuân thủ quy định về khoảng cách an toàn đối với xe chạy liền trước khi chạy trên đường cao tốc").

rule(d6_k5_dd).
rule_type(d6_k5_dd,primary_violation).
article(d6_k5_dd,6).
clause(d6_k5_dd,5).
point(d6_k5_dd,"dd").
subject(d6_k5_dd,car).
action(d6_k5_dd,speed_over_limit_10_to_20).
fine_min(d6_k5_dd,4000000).
fine_max(d6_k5_dd,6000000).
original_vi_text(d6_k5_dd,"Điều khiển xe chạy quá tốc độ quy định từ 10 km/h đến 20 km/h").

rule(d6_k5_e).
rule_type(d6_k5_e,primary_violation).
article(d6_k5_e,6).
clause(d6_k5_e,5).
point(d6_k5_e,"e").
subject(d6_k5_e,car).
action(d6_k5_e,vehicle_no_duoc_quyen_priority_priority_lap_dat_use_stop_thiet_bi_phat_tin).
fine_min(d6_k5_e,4000000).
fine_max(d6_k5_e,6000000).
original_vi_text(d6_k5_e,"Xe không được quyền ưu tiên lắp đặt, sử dụng thiết bị phát tín hiệu của xe được quyền ưu tiên").

rule(d6_k5_g).
rule_type(d6_k5_g,primary_violation).
article(d6_k5_g,6).
clause(d6_k5_g,5).
point(d6_k5_g,"g").
subject(d6_k5_g,car).
action(d6_k5_g,illegal_lane_change_or_no_signal).
context(d6_k5_g,expressway).
fine_min(d6_k5_g,4000000).
fine_max(d6_k5_g,6000000).
original_vi_text(d6_k5_g,"Chuyển làn đường không đúng nơi cho phép hoặc không có tín hiệu báo trước hoặc chuyển làn đường không đúng quy định \"mỗi lần chuyển làn đường chỉ được phép chuyển sang một làn đường liền kề\" khi chạy trên đường cao tốc").

rule(d6_k5_h).
rule_type(d6_k5_h,primary_violation).
article(d6_k5_h,6).
clause(d6_k5_h,5).
point(d6_k5_h,"h").
subject(d6_k5_h,car).
action(d6_k5_h,stop_tay_prohibited_va_use_stop_dien_thoai_hoac_cac_thiet_bi_dien_tu).
fine_min(d6_k5_h,4000000).
fine_max(d6_k5_h,6000000).
original_vi_text(d6_k5_h,"Dùng tay cầm và sử dụng điện thoại hoặc các thiết bị điện tử khác khi điều khiển phương tiện tham gia giao thông đang di chuyển trên đường bộ").

rule(d6_k5_i).
rule_type(d6_k5_i,primary_violation).
article(d6_k5_i,6).
clause(d6_k5_i,5).
point(d6_k5_i,"i").
subject(d6_k5_i,car).
action(d6_k5_i,go_enter_khu_vuc_prohibited_road_co_sign_signal_signal_co_noi_stop_prohibited).
exception_ref(d6_k5_i,6,9,"d").
exception_ref(d6_k5_i,6,9,"dd").
fine_min(d6_k5_i,4000000).
fine_max(d6_k5_i,6000000).
original_vi_text(d6_k5_i,"Đi vào khu vực cấm, đường có biển báo hiệu có nội dung cấm đi vào đối với loại phương tiện đang điều khiển").

rule(d6_k5_k).
rule_type(d6_k5_k,primary_violation).
article(d6_k5_k,6).
clause(d6_k5_k,5).
point(d6_k5_k,"k").
subject(d6_k5_k,car).
action(d6_k5_k,stop_vehicle_level_vehicle_u_turn_turn_vehicle_left_quy_dinh_gay_un_tac_traffic).
fine_min(d6_k5_k,4000000).
fine_max(d6_k5_k,6000000).
original_vi_text(d6_k5_k,"Dừng xe, đỗ xe, quay đầu xe trái quy định gây ùn tắc giao thông").

rule(d6_k5_l_1).
rule_type(d6_k5_l_1,primary_violation).
article(d6_k5_l_1,6).
clause(d6_k5_l_1,5).
point(d6_k5_l_1,"l").
subject(d6_k5_l_1,car).
action(d6_k5_l_1,change_turn_no_yield_quyen_go_truoc_cho_nguoi_go_bo_vehicle_lane_cua).
fine_min(d6_k5_l_1,4000000).
fine_max(d6_k5_l_1,6000000).
original_vi_text(d6_k5_l_1,"Chuyển hướng không nhường quyền đi trước cho: người đi bộ, xe lăn của người khuyết tật qua đường tại nơi có vạch kẻ đường dành cho người đi bộ").

rule(d6_k5_l_2).
rule_type(d6_k5_l_2,primary_violation).
article(d6_k5_l_2,6).
clause(d6_k5_l_2,5).
point(d6_k5_l_2,"l").
subject(d6_k5_l_2,car).
action(d6_k5_l_2,vehicle_tho_so_dang_go_tren_phan_road_danh_cho_vehicle_tho_so).
fine_min(d6_k5_l_2,4000000).
fine_max(d6_k5_l_2,6000000).
original_vi_text(d6_k5_l_2,"xe thô sơ đang đi trên phần đường dành cho xe thô sơ").

rule(d6_k5_m_1).
rule_type(d6_k5_m_1,primary_violation).
article(d6_k5_m_1,6).
clause(d6_k5_m_1,5).
point(d6_k5_m_1,"m").
subject(d6_k5_m_1,car).
action(d6_k5_m_1,change_turn_no_yield_road_cho_cac_vehicle_go_wrong_beam).
fine_min(d6_k5_m_1,4000000).
fine_max(d6_k5_m_1,6000000).
original_vi_text(d6_k5_m_1,"Chuyển hướng không nhường đường cho: các xe đi ngược chiều").

rule(d6_k5_m_2).
rule_type(d6_k5_m_2,primary_violation).
article(d6_k5_m_2,6).
clause(d6_k5_m_2,5).
point(d6_k5_m_2,"m").
subject(d6_k5_m_2,car).
action(d6_k5_m_2,nguoi_go_bo_vehicle_tho_so_dang_qua_road_tai_noi_no_co_marking).
fine_min(d6_k5_m_2,4000000).
fine_max(d6_k5_m_2,6000000).
original_vi_text(d6_k5_m_2,"người đi bộ, xe thô sơ đang qua đường tại nơi không có vạch kẻ đường cho người đi bộ").

rule(d6_k5_n).
rule_type(d6_k5_n,primary_violation).
article(d6_k5_n,6).
clause(d6_k5_n,5).
point(d6_k5_n,"n").
subject(d6_k5_n,car).
action(d6_k5_n,no_giam_speed_level_hoac_stop_lai_va_yield_road_khi_dieu_khien_vehicle).
fine_min(d6_k5_n,4000000).
fine_max(d6_k5_n,6000000).
original_vi_text(d6_k5_n,"Không giảm tốc độ (hoặc dừng lại) và nhường đường khi điều khiển xe đi từ đường không ưu tiên ra đường ưu tiên, từ đường nhánh ra đường chính").

rule(d6_k5_o_1).
rule_type(d6_k5_o_1,primary_violation).
article(d6_k5_o_1,6).
clause(d6_k5_o_1,5).
point(d6_k5_o_1,"o").
subject(d6_k5_o_1,car).
action(d6_k5_o_1,fail_to_yield_at_non_roundabout_intersection).
fine_min(d6_k5_o_1,4000000).
fine_max(d6_k5_o_1,6000000).
original_vi_text(d6_k5_o_1,"Không giảm tốc độ và nhường đường cho xe đi đến từ bên phải tại nơi đường giao nhau không có báo hiệu đi theo vòng xuyến").

rule(d6_k5_o_2).
rule_type(d6_k5_o_2,primary_violation).
article(d6_k5_o_2,6).
clause(d6_k5_o_2,5).
point(d6_k5_o_2,"o").
subject(d6_k5_o_2,car).
action(d6_k5_o_2,fail_to_yield_at_roundabout).
fine_min(d6_k5_o_2,4000000).
fine_max(d6_k5_o_2,6000000).
original_vi_text(d6_k5_o_2,"không giảm tốc độ và nhường đường cho xe đi đến từ bên trái tại nơi đường giao nhau có báo hiệu đi theo vòng xuyến").

rule(d6_k5_p_1).
rule_type(d6_k5_p_1,primary_violation).
article(d6_k5_p_1,6).
clause(d6_k5_p_1,5).
point(d6_k5_p_1,"p").
subject(d6_k5_p_1,car).
action(d6_k5_p_1,cho_nguoi_tren_thung_vehicle_left_quy_dinh).
fine_min(d6_k5_p_1,4000000).
fine_max(d6_k5_p_1,6000000).
original_vi_text(d6_k5_p_1,"Chở người trên thùng xe trái quy định").

rule(d6_k5_p_2).
rule_type(d6_k5_p_2,primary_violation).
article(d6_k5_p_2,6).
clause(d6_k5_p_2,5).
point(d6_k5_p_2,"p").
subject(d6_k5_p_2,car).
action(d6_k5_p_2,cho_nguoi_tren_noc_vehicle).
fine_min(d6_k5_p_2,4000000).
fine_max(d6_k5_p_2,6000000).
original_vi_text(d6_k5_p_2,"chở người trên nóc xe").

rule(d6_k5_p_3).
rule_type(d6_k5_p_3,primary_violation).
article(d6_k5_p_3,6).
clause(d6_k5_p_3,5).
point(d6_k5_p_3,"p").
subject(d6_k5_p_3,car).
action(d6_k5_p_3,de_nguoi_du_bam_car_cua_vehicle_ben_ngoai_thanh_vehicle_khi_vehicle_dang).
fine_min(d6_k5_p_3,4000000).
fine_max(d6_k5_p_3,6000000).
original_vi_text(d6_k5_p_3,"để người đu bám ở cửa xe, bên ngoài thành xe khi xe đang chạy").

rule(d6_k5_q).
rule_type(d6_k5_q,primary_violation).
article(d6_k5_q,6).
clause(d6_k5_q,5).
point(d6_k5_q,"q").
subject(d6_k5_q,car).
action(d6_k5_q,motor_cua_vehicle_de_cua_vehicle_motor_no_signal_dam_safe_safety).
fine_min(d6_k5_q,4000000).
fine_max(d6_k5_q,6000000).
original_vi_text(d6_k5_q,"Mở cửa xe, để cửa xe mở không bảo đảm an toàn").

rule(d6_k6_a).
rule_type(d6_k6_a,primary_violation).
article(d6_k6_a,6).
clause(d6_k6_a,6).
point(d6_k6_a,"a").
subject(d6_k6_a,car).
action(d6_k6_a,speed_over_limit_over_20_to_35).
fine_min(d6_k6_a,6000000).
fine_max(d6_k6_a,8000000).
original_vi_text(d6_k6_a,"Điều khiển xe chạy quá tốc độ quy định trên 20 km/h đến 35 km/h").

rule(d6_k6_b).
rule_type(d6_k6_b,primary_violation).
article(d6_k6_b,6).
clause(d6_k6_b,6).
point(d6_k6_b,"b").
subject(d6_k6_b,car).
action(d6_k6_b,fail_to_yield_to_priority_vehicle).
fine_min(d6_k6_b,6000000).
fine_max(d6_k6_b,8000000).
original_vi_text(d6_k6_b,"Không nhường đường hoặc gây cản trở xe được quyền ưu tiên đang phát tín hiệu ưu tiên đi làm nhiệm vụ").

rule(d6_k6_c).
rule_type(d6_k6_c,primary_violation).
article(d6_k6_c,6).
clause(d6_k6_c,6).
point(d6_k6_c,"c").
subject(d6_k6_c,car).
action(d6_k6_c,drive_with_alcohol_level_1).
fine_min(d6_k6_c,6000000).
fine_max(d6_k6_c,8000000).
original_vi_text(d6_k6_c,"Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn nhưng chưa vượt quá 50 miligam/100 mililít máu hoặc chưa vượt quá 0,25 miligam/1 lít khí thở").

rule(d6_k6_d).
rule_type(d6_k6_d,primary_violation).
article(d6_k6_d,6).
clause(d6_k6_d,6).
point(d6_k6_d,"d").
subject(d6_k6_d,car).
action(d6_k6_d,dieu_khien_vehicle_go_tren_sidewalk_sidewalk).
context(d6_k6_d,sidewalk).
fine_min(d6_k6_d,6000000).
fine_max(d6_k6_d,8000000).
original_vi_text(d6_k6_d,"Điều khiển xe đi trên vỉa hè").

rule(d6_k7_a).
rule_type(d6_k7_a,primary_violation).
article(d6_k7_a,6).
clause(d6_k7_a,7).
point(d6_k7_a,"a").
subject(d6_k7_a,car).
action(d6_k7_a,speed_over_limit_over_35).
fine_min(d6_k7_a,12000000).
fine_max(d6_k7_a,14000000).
original_vi_text(d6_k7_a,"Điều khiển xe chạy quá tốc độ quy định trên 35 km/h").

rule(d6_k7_b).
rule_type(d6_k7_b,primary_violation).
article(d6_k7_b,6).
clause(d6_k7_b,7).
point(d6_k7_b,"b").
subject(d6_k7_b,car).
action(d6_k7_b,enter_expressway).
context(d6_k7_b,expressway).
fine_min(d6_k7_b,12000000).
fine_max(d6_k7_b,14000000).
original_vi_text(d6_k7_b,"Điều khiển xe chở người bốn bánh có gắn động cơ, xe chở hàng bốn bánh có gắn động cơ đi vào đường cao tốc").

rule(d6_k7_c_1).
rule_type(d6_k7_c_1,primary_violation).
article(d6_k7_c_1,6).
clause(d6_k7_c_1,7).
point(d6_k7_c_1,"c").
subject(d6_k7_c_1,car).
action(d6_k7_c_1,stop_vehicle_level_vehicle_tren_road_highway_speed_no_stop_noi_quy_dinh).
context(d6_k7_c_1,expressway).
fine_min(d6_k7_c_1,12000000).
fine_max(d6_k7_c_1,14000000).
original_vi_text(d6_k7_c_1,"Dừng xe, đỗ xe trên đường cao tốc không đúng nơi quy định").

rule(d6_k7_c_2).
rule_type(d6_k7_c_2,primary_violation).
article(d6_k7_c_2,6).
clause(d6_k7_c_2,7).
point(d6_k7_c_2,"c").
subject(d6_k7_c_2,car).
action(d6_k7_c_2,no_co_signal_signal_bang_light_emergency_emergency_khi_gap_use_co_ky_thuat).
context(d6_k7_c_2,expressway).
fine_min(d6_k7_c_2,12000000).
fine_max(d6_k7_c_2,14000000).
original_vi_text(d6_k7_c_2,"không có báo hiệu bằng đèn khẩn cấp khi gặp sự cố kỹ thuật hoặc bất khả kháng khác buộc phải dừng xe, đỗ xe ở làn dừng xe khẩn cấp trên đường cao tốc").

rule(d6_k7_c_3).
rule_type(d6_k7_c_3,primary_violation).
article(d6_k7_c_3,6).
clause(d6_k7_c_3,7).
point(d6_k7_c_3,"c").
subject(d6_k7_c_3,car).
action(d6_k7_c_3,no_co_signal_signal_bang_light_emergency_emergency_no_dat_sign_canh_signal_chu).
context(d6_k7_c_3,expressway).
fine_min(d6_k7_c_3,12000000).
fine_max(d6_k7_c_3,14000000).
original_vi_text(d6_k7_c_3,"không có báo hiệu bằng đèn khẩn cấp, không đặt biển cảnh báo \"Chú ý xe đỗ\" (hoặc đèn cảnh báo) về phía sau xe khoảng cách tối thiểu 150 mét khi dừng xe, đỗ xe trong trường hợp gặp sự cố kỹ thuật hoặc bất khả kháng khác buộc phải dừng xe, đỗ xe trên một phần làn đường xe chạy trên đường cao tốc").

rule(d6_k8).
rule_type(d6_k8,primary_violation).
article(d6_k8,6).
clause(d6_k8,8).
subject(d6_k8,car).
action(d6_k8,vi_pham_gay_tai_nan_traffic_traffic_no_stop_ngay_phuong_priority_no_giu).
fine_min(d6_k8,16000000).
fine_max(d6_k8,18000000).
original_vi_text(d6_k8,"vi phạm gây tai nạn giao thông không dừng ngay phương tiện, không giữ nguyên hiện trường, không trợ giúp người bị nạn, không ở lại hiện trường hoặc không đến trình báo ngay với cơ quan công an, Ủy ban nhân dân nơi gần nhất").

rule(d6_k9_a).
rule_type(d6_k9_a,primary_violation).
article(d6_k9_a,6).
clause(d6_k9_a,9).
point(d6_k9_a,"a").
subject(d6_k9_a,car).
action(d6_k9_a,drive_with_alcohol_level_2).
fine_min(d6_k9_a,18000000).
fine_max(d6_k9_a,20000000).
original_vi_text(d6_k9_a,"Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn vượt quá 50 miligam đến 80 miligam/100 mililít máu hoặc vượt quá 0,25 miligam đến 0,4 miligam/1 lít khí thở").

rule(d6_k9_b).
rule_type(d6_k9_b,primary_violation).
article(d6_k9_b,6).
clause(d6_k9_b,9).
point(d6_k9_b,"b").
subject(d6_k9_b,car).
action(d6_k9_b,disobey_traffic_light).
fine_min(d6_k9_b,18000000).
fine_max(d6_k9_b,20000000).
original_vi_text(d6_k9_b,"Không chấp hành hiệu lệnh của đèn tín hiệu giao thông").

rule(d6_k9_c).
rule_type(d6_k9_c,primary_violation).
article(d6_k9_c,6).
clause(d6_k9_c,9).
point(d6_k9_c,"c").
subject(d6_k9_c,car).
action(d6_k9_c,disobey_traffic_controller).
fine_min(d6_k9_c,18000000).
fine_max(d6_k9_c,20000000).
original_vi_text(d6_k9_c,"Không chấp hành hiệu lệnh, hướng dẫn của người điều khiển giao thông hoặc người kiểm soát giao thông").

rule(d6_k9_d).
rule_type(d6_k9_d,primary_violation).
article(d6_k9_d,6).
clause(d6_k9_d,9).
point(d6_k9_d,"d").
subject(d6_k9_d,car).
action(d6_k9_d,wrong_way_on_one_way_road).
context(d6_k9_d,no_entry_road).
exception_ref(d6_k9_d,6,11,"dd").
fine_min(d6_k9_d,18000000).
fine_max(d6_k9_d,20000000).
original_vi_text(d6_k9_d,"Đi ngược chiều của đường một chiều, đi ngược chiều trên đường có biển \"Cấm đi ngược chiều\"").

rule(d6_k10_a_1).
rule_type(d6_k10_a_1,primary_violation).
article(d6_k10_a_1,6).
clause(d6_k10_a_1,10).
point(d6_k10_a_1,"a").
subject(d6_k10_a_1,car).
action(d6_k10_a_1,dieu_khien_vehicle_no_quan_close_giam_speed_level_hoac_stop_lai_de_signal).
exception_ref(d6_k10_a_1,6,11,"dd").
fine_min(d6_k10_a_1,20000000).
fine_max(d6_k10_a_1,22000000).
original_vi_text(d6_k10_a_1,"Điều khiển xe không quan sát, giảm tốc độ hoặc dừng lại để bảo đảm an toàn theo quy định mà gây tai nạn giao thông").

rule(d6_k10_a_2).
rule_type(d6_k10_a_2,primary_violation).
article(d6_k10_a_2,6).
clause(d6_k10_a_2,10).
point(d6_k10_a_2,"a").
subject(d6_k10_a_2,car).
action(d6_k10_a_2,dieu_khien_vehicle_chay_qua_speed_level_quy_dinh_gay_tai_nan_traffic_traffic).
exception_ref(d6_k10_a_2,6,11,"dd").
fine_min(d6_k10_a_2,20000000).
fine_max(d6_k10_a_2,22000000).
original_vi_text(d6_k10_a_2,"điều khiển xe chạy quá tốc độ quy định gây tai nạn giao thông").

rule(d6_k10_a_3).
rule_type(d6_k10_a_3,primary_violation).
article(d6_k10_a_3,6).
clause(d6_k10_a_3,10).
point(d6_k10_a_3,"a").
subject(d6_k10_a_3,car).
action(d6_k10_a_3,stop_vehicle_level_vehicle_u_turn_turn_vehicle_reverse_vehicle_tranh_vehicle_overtake_vehicle_change).
exception_ref(d6_k10_a_3,6,11,"dd").
fine_min(d6_k10_a_3,20000000).
fine_max(d6_k10_a_3,22000000).
original_vi_text(d6_k10_a_3,"dừng xe, đỗ xe, quay đầu xe, lùi xe, tránh xe, vượt xe, chuyển hướng, chuyển làn đường không đúng quy định gây tai nạn giao thông").

rule(d6_k10_a_4).
rule_type(d6_k10_a_4,primary_violation).
article(d6_k10_a_4,6).
clause(d6_k10_a_4,10).
point(d6_k10_a_4,"a").
subject(d6_k10_a_4,car).
action(d6_k10_a_4,no_go_stop_phan_road_lane_road_no_giu_khoang_cach_safe_safety_giua).
exception_ref(d6_k10_a_4,6,11,"dd").
fine_min(d6_k10_a_4,20000000).
fine_max(d6_k10_a_4,22000000).
original_vi_text(d6_k10_a_4,"không đi đúng phần đường, làn đường, không giữ khoảng cách an toàn giữa hai xe theo quy định gây tai nạn giao thông hoặc đi vào đường có biển báo hiệu có nội dung cấm đi vào đối với loại phương tiện đang điều khiển gây tai nạn giao thông").

rule(d6_k10_b_1).
rule_type(d6_k10_b_1,primary_violation).
article(d6_k10_b_1,6).
clause(d6_k10_b_1,10).
point(d6_k10_b_1,"b").
subject(d6_k10_b_1,car).
action(d6_k10_b_1,vi_pham_quy_dinh_tai_mot_trong_cac_diem_khoan_sau_cua_dieu_nay).
fine_min(d6_k10_b_1,20000000).
fine_max(d6_k10_b_1,22000000).
original_vi_text(d6_k10_b_1,"Vi phạm quy định tại một trong các điểm, khoản sau của Điều này mà gây tai nạn giao thông: điểm a, điểm b, điểm c, điểm d, điểm đ khoản 1").

rule(d6_k10_b_2).
rule_type(d6_k10_b_2,primary_violation).
article(d6_k10_b_2,6).
clause(d6_k10_b_2,10).
point(d6_k10_b_2,"b").
subject(d6_k10_b_2,car).
action(d6_k10_b_2,diem_c_khoan_2).
fine_min(d6_k10_b_2,20000000).
fine_max(d6_k10_b_2,22000000).
original_vi_text(d6_k10_b_2,"điểm c khoản 2").

rule(d6_k10_b_3).
rule_type(d6_k10_b_3,primary_violation).
article(d6_k10_b_3,6).
clause(d6_k10_b_3,10).
point(d6_k10_b_3,"b").
subject(d6_k10_b_3,car).
action(d6_k10_b_3,diem_b_diem_g_diem_h_diem_n_diem_car_diem_p_khoan_3).
fine_min(d6_k10_b_3,20000000).
fine_max(d6_k10_b_3,22000000).
original_vi_text(d6_k10_b_3,"điểm b, điểm g, điểm h, điểm n, điểm o, điểm p, khoản 3").

rule(d6_k10_b_4).
rule_type(d6_k10_b_4,primary_violation).
article(d6_k10_b_4,6).
clause(d6_k10_b_4,10).
point(d6_k10_b_4,"b").
subject(d6_k10_b_4,car).
action(d6_k10_b_4,diem_a_diem_c_diem_d_khoan_4).
fine_min(d6_k10_b_4,20000000).
fine_max(d6_k10_b_4,22000000).
original_vi_text(d6_k10_b_4,"điểm a, điểm c, điểm d khoản 4").

rule(d6_k10_b_5).
rule_type(d6_k10_b_5,primary_violation).
article(d6_k10_b_5,6).
clause(d6_k10_b_5,10).
point(d6_k10_b_5,"b").
subject(d6_k10_b_5,car).
action(d6_k10_b_5,diem_c_diem_d_diem_e_diem_h_diem_n_diem_car_diem_q).
fine_min(d6_k10_b_5,20000000).
fine_max(d6_k10_b_5,22000000).
original_vi_text(d6_k10_b_5,"điểm c, điểm d, điểm e, điểm h, điểm n, điểm o, điểm q khoản 5").

rule(d6_k10_b_6).
rule_type(d6_k10_b_6,primary_violation).
article(d6_k10_b_6,6).
clause(d6_k10_b_6,10).
point(d6_k10_b_6,"b").
subject(d6_k10_b_6,car).
action(d6_k10_b_6,diem_b_khoan_7).
fine_min(d6_k10_b_6,20000000).
fine_max(d6_k10_b_6,22000000).
original_vi_text(d6_k10_b_6,"điểm b khoản 7").

rule(d6_k10_b_7).
rule_type(d6_k10_b_7,primary_violation).
article(d6_k10_b_7,6).
clause(d6_k10_b_7,10).
point(d6_k10_b_7,"b").
subject(d6_k10_b_7,car).
action(d6_k10_b_7,diem_b_diem_c_diem_d_khoan_9_dieu_nay).
fine_min(d6_k10_b_7,20000000).
fine_max(d6_k10_b_7,22000000).
original_vi_text(d6_k10_b_7,"điểm b, điểm c, điểm d khoản 9 Điều này").

rule(d6_k11_a).
rule_type(d6_k11_a,primary_violation).
article(d6_k11_a,6).
clause(d6_k11_a,11).
point(d6_k11_a,"a").
subject(d6_k11_a,car).
action(d6_k11_a,drive_with_alcohol_level_3).
fine_min(d6_k11_a,30000000).
fine_max(d6_k11_a,40000000).
original_vi_text(d6_k11_a,"Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn vượt quá 80 miligam/100 mililít máu hoặc vượt quá 0,4 miligam/1 lít khí thở").

rule(d6_k11_b).
rule_type(d6_k11_b,primary_violation).
article(d6_k11_b,6).
clause(d6_k11_b,11).
point(d6_k11_b,"b").
subject(d6_k11_b,car).
action(d6_k11_b,refuse_alcohol_test).
fine_min(d6_k11_b,30000000).
fine_max(d6_k11_b,40000000).
original_vi_text(d6_k11_b,"Không chấp hành yêu cầu kiểm tra về nồng độ cồn của người thi hành công vụ").

rule(d6_k11_c).
rule_type(d6_k11_c,primary_violation).
article(d6_k11_c,6).
clause(d6_k11_c,11).
point(d6_k11_c,"c").
subject(d6_k11_c,car).
action(d6_k11_c,drive_with_drugs).
fine_min(d6_k11_c,30000000).
fine_max(d6_k11_c,40000000).
original_vi_text(d6_k11_c,"Điều khiển xe trên đường mà trong cơ thể có chất ma túy hoặc chất kích thích khác mà pháp luật cấm sử dụng").

rule(d6_k11_d).
rule_type(d6_k11_d,primary_violation).
article(d6_k11_d,6).
clause(d6_k11_d,11).
point(d6_k11_d,"d").
subject(d6_k11_d,car).
action(d6_k11_d,refuse_drug_test).
fine_min(d6_k11_d,30000000).
fine_max(d6_k11_d,40000000).
original_vi_text(d6_k11_d,"Không chấp hành yêu cầu kiểm tra về chất ma túy hoặc chất kích thích khác mà pháp luật cấm sử dụng của người thi hành công vụ").

rule(d6_k11_dd).
rule_type(d6_k11_dd,primary_violation).
article(d6_k11_dd,6).
clause(d6_k11_dd,11).
point(d6_k11_dd,"dd").
subject(d6_k11_dd,car).
action(d6_k11_dd,reverse_on_expressway).
context(d6_k11_dd,expressway).
fine_min(d6_k11_dd,30000000).
fine_max(d6_k11_dd,40000000).
original_vi_text(d6_k11_dd,"Điều khiển xe đi ngược chiều trên đường cao tốc, lùi xe trên đường cao tốc, quay đầu xe trên đường cao tốc").

rule(d6_k12_1).
rule_type(d6_k12_1,primary_violation).
article(d6_k12_1,6).
clause(d6_k12_1,12).
subject(d6_k12_1,car).
action(d6_k12_1,swerving_or_zigzag_driving).
fine_min(d6_k12_1,40000000).
fine_max(d6_k12_1,50000000).
original_vi_text(d6_k12_1,"điều khiển xe lạng lách, đánh võng trên đường bộ").

rule(d6_k12_2).
rule_type(d6_k12_2,primary_violation).
article(d6_k12_2,6).
clause(d6_k12_2,12).
subject(d6_k12_2,car).
action(d6_k12_2,chay_qua_speed_level_duoi_nhau_tren_road_bo).
fine_min(d6_k12_2,40000000).
fine_max(d6_k12_2,50000000).
original_vi_text(d6_k12_2,"chạy quá tốc độ đuổi nhau trên đường bộ").

rule(d6_k12_3).
rule_type(d6_k12_3,primary_violation).
article(d6_k12_3,6).
clause(d6_k12_3,12).
subject(d6_k12_3,car).
action(d6_k12_3,drive_with_feet_on_steering_wheel).
fine_min(d6_k12_3,40000000).
fine_max(d6_k12_3,50000000).
original_vi_text(d6_k12_3,"dùng chân điều khiển vô lăng xe khi xe đang chạy trên đường bộ").

rule(d6_k13).
rule_type(d6_k13,primary_violation).
article(d6_k13,6).
clause(d6_k13,13).
subject(d6_k13,car).
action(d6_k13,vi_pham_quy_dinh_tai_khoan_12_dieu_nay_drug_gay_tai_nan_traffic).
fine_min(d6_k13,50000000).
fine_max(d6_k13,70000000).
original_vi_text(d6_k13,"vi phạm quy định tại khoản 12 Điều này mà gây tai nạn giao thông").

rule(d7_k1_a).
rule_type(d7_k1_a,primary_violation).
article(d7_k1_a,7).
clause(d7_k1_a,1).
point(d7_k1_a,"a").
subject(d7_k1_a,motorbike).
action(d7_k1_a,disobey_road_signs_or_markings).
fine_min(d7_k1_a,200000).
fine_max(d7_k1_a,400000).
original_vi_text(d7_k1_a,"Không chấp hành hiệu lệnh, chỉ dẫn của biển báo hiệu, vạch kẻ đường").

rule(d7_k1_b).
rule_type(d7_k1_b,primary_violation).
article(d7_k1_b,7).
clause(d7_k1_b,1).
point(d7_k1_b,"b").
subject(d7_k1_b,motorbike).
action(d7_k1_b,overtake_without_proper_signal).
fine_min(d7_k1_b,200000).
fine_max(d7_k1_b,400000).
original_vi_text(d7_k1_b,"Không có tín hiệu trước khi vượt hoặc có tín hiệu vượt xe nhưng không sử dụng trong suốt quá trình vượt xe").

rule(d7_k1_c).
rule_type(d7_k1_c,primary_violation).
article(d7_k1_c,7).
clause(d7_k1_c,1).
point(d7_k1_c,"c").
subject(d7_k1_c,motorbike).
action(d7_k1_c,reverse_vehicle_motor_car_ba_banh_no_quan_close_hai_ben_phia_sau_vehicle).
fine_min(d7_k1_c,200000).
fine_max(d7_k1_c,400000).
original_vi_text(d7_k1_c,"Lùi xe mô tô ba bánh không quan sát hai bên, phía sau xe hoặc không có tín hiệu lùi xe").

rule(d7_k1_d).
rule_type(d7_k1_d,primary_violation).
article(d7_k1_d,7).
clause(d7_k1_d,1).
point(d7_k1_d,"d").
subject(d7_k1_d,motorbike).
action(d7_k1_d,cho_nguoi_ngoi_tren_vehicle_use_stop_car_du).
fine_min(d7_k1_d,200000).
fine_max(d7_k1_d,400000).
original_vi_text(d7_k1_d,"Chở người ngồi trên xe sử dụng ô (dù)").

rule(d7_k1_dd).
rule_type(d7_k1_dd,primary_violation).
article(d7_k1_dd,7).
clause(d7_k1_dd,1).
point(d7_k1_dd,"dd").
subject(d7_k1_dd,motorbike).
action(d7_k1_dd,no_tuan_thu_cac_quy_dinh_ve_yield_road_tai_noi_road_traffic_nhau).
exception_ref(d7_k1_dd,7,6,"c").
exception_ref(d7_k1_dd,7,6,"d").
fine_min(d7_k1_dd,200000).
fine_max(d7_k1_dd,400000).
original_vi_text(d7_k1_dd,"Không tuân thủ các quy định về nhường đường tại nơi đường giao nhau").

rule(d7_k1_e).
rule_type(d7_k1_e,primary_violation).
article(d7_k1_e,7).
clause(d7_k1_e,1).
point(d7_k1_e,"e").
subject(d7_k1_e,motorbike).
action(d7_k1_e,illegal_lane_change_or_no_signal).
fine_min(d7_k1_e,200000).
fine_max(d7_k1_e,400000).
original_vi_text(d7_k1_e,"Chuyển làn đường không đúng nơi cho phép hoặc không có tín hiệu báo trước hoặc chuyển làn đường không đúng quy định \"mỗi lần chuyển làn đường chỉ được phép chuyển sang một làn đường liền kề\"").

rule(d7_k1_g).
rule_type(d7_k1_g,primary_violation).
article(d7_k1_g,7).
clause(d7_k1_g,1).
point(d7_k1_g,"g").
subject(d7_k1_g,motorbike).
action(d7_k1_g,no_use_stop_light_beam_sang_trong_thoi_gian_tu_18_gio_ngay_hom).
context(d7_k1_g,time_18_to_06).
fine_min(d7_k1_g,200000).
fine_max(d7_k1_g,400000).
original_vi_text(d7_k1_g,"Không sử dụng đèn chiếu sáng trong thời gian từ 18 giờ ngày hôm trước đến 06 giờ ngày hôm sau hoặc khi có sương mù, khói, bụi, trời mưa, thời tiết xấu làm hạn chế tầm nhìn").

rule(d7_k1_h_1).
rule_type(d7_k1_h_1,primary_violation).
article(d7_k1_h_1,7).
clause(d7_k1_h_1,1).
point(d7_k1_h_1,"h").
subject(d7_k1_h_1,motorbike).
action(d7_k1_h_1,tranh_vehicle_no_stop_quy_dinh).
fine_min(d7_k1_h_1,200000).
fine_max(d7_k1_h_1,400000).
original_vi_text(d7_k1_h_1,"Tránh xe không đúng quy định").

rule(d7_k1_h_2).
rule_type(d7_k1_h_2,primary_violation).
article(d7_k1_h_2,7).
clause(d7_k1_h_2,1).
point(d7_k1_h_2,"h").
subject(d7_k1_h_2,motorbike).
action(d7_k1_h_2,use_stop_light_beam_high_khi_gap_nguoi_go_bo_qua_road_hoac_khi).
fine_min(d7_k1_h_2,200000).
fine_max(d7_k1_h_2,400000).
original_vi_text(d7_k1_h_2,"sử dụng đèn chiếu xa khi gặp người đi bộ qua đường hoặc khi đi trên đoạn đường qua khu dân cư có hệ thống chiếu sáng đang hoạt động hoặc khi gặp xe đi ngược chiều (").

rule(d7_k1_i).
rule_type(d7_k1_i,primary_violation).
article(d7_k1_i,7).
clause(d7_k1_i,1).
point(d7_k1_i,"i").
subject(d7_k1_i,motorbike).
action(d7_k1_i,use_horn_at_night_in_residential_or_hospital_zone).
context(d7_k1_i,residential_area).
context(d7_k1_i,hospital_zone).
context(d7_k1_i,time_22_to_05).
fine_min(d7_k1_i,200000).
fine_max(d7_k1_i,400000).
original_vi_text(d7_k1_i,"Sử dụng còi trong thời gian từ 22 giờ ngày hôm trước đến 05 giờ ngày hôm sau trong khu đông dân cư, khu vực cơ sở khám bệnh, chữa bệnh").

rule(d7_k1_k).
rule_type(d7_k1_k,primary_violation).
article(d7_k1_k,7).
clause(d7_k1_k,1).
point(d7_k1_k,"k").
subject(d7_k1_k,motorbike).
action(d7_k1_k,dieu_khien_vehicle_chay_duoi_speed_level_toi_thieu_tren_doan_road_bo_co).
fine_min(d7_k1_k,200000).
fine_max(d7_k1_k,400000).
original_vi_text(d7_k1_k,"Điều khiển xe chạy dưới tốc độ tối thiểu trên đoạn đường bộ có quy định tốc độ tối thiểu cho phép").

rule(d7_k2_a).
rule_type(d7_k2_a,primary_violation).
article(d7_k2_a,7).
clause(d7_k2_a,2).
point(d7_k2_a,"a").
subject(d7_k2_a,motorbike).
action(d7_k2_a,stop_vehicle_level_vehicle_tren_phan_road_vehicle_chay_car_doan_road_ngoai_level).
context(d7_k2_a,roadway).
fine_min(d7_k2_a,400000).
fine_max(d7_k2_a,600000).
original_vi_text(d7_k2_a,"Dừng xe, đỗ xe trên phần đường xe chạy ở đoạn đường ngoài đô thị nơi có lề đường").

rule(d7_k2_b).
rule_type(d7_k2_b,primary_violation).
article(d7_k2_b,7).
clause(d7_k2_b,2).
point(d7_k2_b,"b").
subject(d7_k2_b,motorbike).
action(d7_k2_b,speed_over_limit_5_to_under_10).
fine_min(d7_k2_b,400000).
fine_max(d7_k2_b,600000).
original_vi_text(d7_k2_b,"Điều khiển xe chạy quá tốc độ quy định từ 05 km/h đến dưới 10 km/h").

rule(d7_k2_c).
rule_type(d7_k2_c,primary_violation).
article(d7_k2_c,7).
clause(d7_k2_c,2).
point(d7_k2_c,"c").
subject(d7_k2_c,motorbike).
action(d7_k2_c,dieu_khien_vehicle_chay_speed_level_thap_drug_no_go_ben_right_phan_road).
fine_min(d7_k2_c,400000).
fine_max(d7_k2_c,600000).
original_vi_text(d7_k2_c,"Điều khiển xe chạy tốc độ thấp mà không đi bên phải phần đường xe chạy gây cản trở giao thông").

rule(d7_k2_d_1).
rule_type(d7_k2_d_1,primary_violation).
article(d7_k2_d_1,7).
clause(d7_k2_d_1,2).
point(d7_k2_d_1,"d").
subject(d7_k2_d_1,motorbike).
action(d7_k2_d_1,stop_vehicle_level_vehicle_car_long_road_gay_can_tro_traffic_traffic).
fine_min(d7_k2_d_1,400000).
fine_max(d7_k2_d_1,600000).
original_vi_text(d7_k2_d_1,"Dừng xe, đỗ xe ở lòng đường gây cản trở giao thông").

rule(d7_k2_d_2).
rule_type(d7_k2_d_2,primary_violation).
article(d7_k2_d_2,7).
clause(d7_k2_d_2,2).
point(d7_k2_d_2,"d").
subject(d7_k2_d_2,motorbike).
action(d7_k2_d_2,tu_tap_tu_03_vehicle_tro_len_car_long_road_trong_tunnel_road_bo).
context(d7_k2_d_2,tunnel).
fine_min(d7_k2_d_2,400000).
fine_max(d7_k2_d_2,600000).
original_vi_text(d7_k2_d_2,"tụ tập từ 03 xe trở lên ở lòng đường, trong hầm đường bộ").

rule(d7_k2_d_3).
rule_type(d7_k2_d_3,primary_violation).
article(d7_k2_d_3,7).
clause(d7_k2_d_3,2).
point(d7_k2_d_3,"d").
subject(d7_k2_d_3,motorbike).
action(d7_k2_d_3,level_de_vehicle_car_long_road_sidewalk_sidewalk_left_permit).
fine_min(d7_k2_d_3,400000).
fine_max(d7_k2_d_3,600000).
original_vi_text(d7_k2_d_3,"đỗ, để xe ở lòng đường, vỉa hè trái phép").

rule(d7_k2_dd).
rule_type(d7_k2_dd,primary_violation).
article(d7_k2_dd,7).
clause(d7_k2_dd,2).
point(d7_k2_dd,"dd").
subject(d7_k2_dd,motorbike).
action(d7_k2_dd,vehicle_no_duoc_quyen_priority_priority_lap_dat_use_stop_thiet_bi_phat_tin).
fine_min(d7_k2_dd,400000).
fine_max(d7_k2_dd,600000).
original_vi_text(d7_k2_dd,"Xe không được quyền ưu tiên lắp đặt, sử dụng thiết bị phát tín hiệu của xe được quyền ưu tiên").

rule(d7_k2_e_1).
rule_type(d7_k2_e_1,primary_violation).
article(d7_k2_e_1,7).
clause(d7_k2_e_1,2).
point(d7_k2_e_1,"e").
subject(d7_k2_e_1,motorbike).
action(d7_k2_e_1,stop_vehicle_level_vehicle_tren_diem_don_tra_khach_noi_road_bo_traffic_nhau).
context(d7_k2_e_1,pedestrian_crossing).
context(d7_k2_e_1,pickup_dropoff_zone).
fine_min(d7_k2_e_1,400000).
fine_max(d7_k2_e_1,600000).
original_vi_text(d7_k2_e_1,"Dừng xe, đỗ xe trên điểm đón, trả khách, nơi đường bộ giao nhau, trên phần đường dành cho người đi bộ qua đường").

rule(d7_k2_e_2).
rule_type(d7_k2_e_2,primary_violation).
article(d7_k2_e_2,7).
clause(d7_k2_e_2,2).
point(d7_k2_e_2,"e").
subject(d7_k2_e_2,motorbike).
action(d7_k2_e_2,stop_vehicle_noi_co_sign_prohibited_stop_vehicle_va_level_vehicle).
fine_min(d7_k2_e_2,400000).
fine_max(d7_k2_e_2,600000).
original_vi_text(d7_k2_e_2,"dừng xe nơi có biển \"Cấm dừng xe và đỗ xe\"").

rule(d7_k2_e_3).
rule_type(d7_k2_e_3,primary_violation).
article(d7_k2_e_3,7).
clause(d7_k2_e_3,2).
point(d7_k2_e_3,"e").
subject(d7_k2_e_3,motorbike).
action(d7_k2_e_3,level_vehicle_tai_noi_co_sign_prohibited_level_vehicle_hoac_sign_prohibited_stop_vehicle).
fine_min(d7_k2_e_3,400000).
fine_max(d7_k2_e_3,600000).
original_vi_text(d7_k2_e_3,"đỗ xe tại nơi có biển \"Cấm đỗ xe\" hoặc biển \"Cấm dừng xe và đỗ xe\"").

rule(d7_k2_e_4).
rule_type(d7_k2_e_4,primary_violation).
article(d7_k2_e_4,7).
clause(d7_k2_e_4,2).
point(d7_k2_e_4,"e").
subject(d7_k2_e_4,motorbike).
action(d7_k2_e_4,no_tuan_thu_cac_quy_dinh_ve_stop_vehicle_level_vehicle_tai_noi_road).
context(d7_k2_e_4,intersection).
context(d7_k2_e_4,railway_crossing).
fine_min(d7_k2_e_4,400000).
fine_max(d7_k2_e_4,600000).
original_vi_text(d7_k2_e_4,"không tuân thủ các quy định về dừng xe, đỗ xe tại nơi đường bộ giao nhau cùng mức với đường sắt").

rule(d7_k2_e_5).
rule_type(d7_k2_e_5,primary_violation).
article(d7_k2_e_5,7).
clause(d7_k2_e_5,2).
point(d7_k2_e_5,"e").
subject(d7_k2_e_5,motorbike).
action(d7_k2_e_5,stop_vehicle_level_vehicle_trong_pham_vi_obey_lang_safe_safety_traffic_traffic_road).
fine_min(d7_k2_e_5,400000).
fine_max(d7_k2_e_5,600000).
original_vi_text(d7_k2_e_5,"dừng xe, đỗ xe trong phạm vi hành lang an toàn giao thông đường sắt").

rule(d7_k2_g).
rule_type(d7_k2_g,primary_violation).
article(d7_k2_g,7).
clause(d7_k2_g,2).
point(d7_k2_g,"g").
subject(d7_k2_g,motorbike).
action(d7_k2_g,cho_theo_02_nguoi_tren_vehicle).
fine_min(d7_k2_g,400000).
fine_max(d7_k2_g,600000).
original_vi_text(d7_k2_g,"Chở theo 02 người trên xe").

rule(d7_k2_h).
rule_type(d7_k2_h,primary_violation).
article(d7_k2_h,7).
clause(d7_k2_h,2).
point(d7_k2_h,"h").
subject(d7_k2_h,motorbike).
action(d7_k2_h,no_doi_mu_signal_hiem_cho_nguoi_go_motor_car_vehicle_machine_hoac_doi).
fine_min(d7_k2_h,400000).
fine_max(d7_k2_h,600000).
original_vi_text(d7_k2_h,"Không đội \"mũ bảo hiểm cho người đi mô tô, xe máy\" hoặc đội \"mũ bảo hiểm cho người đi mô tô, xe máy\" không cài quai đúng quy cách khi điều khiển xe tham gia giao thông trên đường bộ").

rule(d7_k2_i).
rule_type(d7_k2_i,primary_violation).
article(d7_k2_i,7).
clause(d7_k2_i,2).
point(d7_k2_i,"i").
subject(d7_k2_i,motorbike).
action(d7_k2_i,cho_nguoi_ngoi_tren_vehicle_no_doi_mu_signal_hiem_cho_nguoi_go_motor).
fine_min(d7_k2_i,400000).
fine_max(d7_k2_i,600000).
original_vi_text(d7_k2_i,"Chở người ngồi trên xe không đội \"mũ bảo hiểm cho người đi mô tô, xe máy\" hoặc đội \"mũ bảo hiểm cho người đi mô tô, xe máy\" không cài quai đúng quy cách").

rule(d7_k2_k).
rule_type(d7_k2_k,primary_violation).
article(d7_k2_k,7).
clause(d7_k2_k,2).
point(d7_k2_k,"k").
subject(d7_k2_k,motorbike).
action(d7_k2_k,u_turn_turn_vehicle_tai_noi_no_duoc_u_turn_turn_vehicle).
exception_ref(d7_k2_k,7,4,"d").
fine_min(d7_k2_k,400000).
fine_max(d7_k2_k,600000).
original_vi_text(d7_k2_k,"Quay đầu xe tại nơi không được quay đầu xe").

rule(d7_k3_a).
rule_type(d7_k3_a,primary_violation).
article(d7_k3_a,7).
clause(d7_k3_a,3).
point(d7_k3_a,"a").
subject(d7_k3_a,motorbike).
action(d7_k3_a,change_turn_no_quan_close_hoac_no_signal_dam_khoang_cach_safe_safety_voi).
fine_min(d7_k3_a,600000).
fine_max(d7_k3_a,800000).
original_vi_text(d7_k3_a,"Chuyển hướng không quan sát hoặc không bảo đảm khoảng cách an toàn với xe phía sau hoặc không giảm tốc độ hoặc không có tín hiệu báo hướng rẽ hoặc có tín hiệu báo hướng rẽ nhưng không sử dụng liên tục trong quá trình chuyển hướng (").

rule(d7_k3_b).
rule_type(d7_k3_b,primary_violation).
article(d7_k3_b,7).
clause(d7_k3_b,3).
point(d7_k3_b,"b").
subject(d7_k3_b,motorbike).
action(d7_k3_b,cho_theo_tu_03_nguoi_tro_len_tren_vehicle).
fine_min(d7_k3_b,600000).
fine_max(d7_k3_b,800000).
original_vi_text(d7_k3_b,"Chở theo từ 03 người trở lên trên xe").

rule(d7_k3_c).
rule_type(d7_k3_c,primary_violation).
article(d7_k3_c,7).
clause(d7_k3_c,3).
point(d7_k3_c,"c").
subject(d7_k3_c,motorbike).
action(d7_k3_c,stop_vehicle_level_vehicle_tren_bridge).
context(d7_k3_c,bridge).
fine_min(d7_k3_c,600000).
fine_max(d7_k3_c,800000).
original_vi_text(d7_k3_c,"Dừng xe, đỗ xe trên cầu").

rule(d7_k3_d_1).
rule_type(d7_k3_d_1,primary_violation).
article(d7_k3_d_1,7).
clause(d7_k3_d_1,3).
point(d7_k3_d_1,"d").
subject(d7_k3_d_1,motorbike).
action(d7_k3_d_1,dieu_khien_vehicle_no_go_ben_right_theo_beam_go_cua_minh).
fine_min(d7_k3_d_1,600000).
fine_max(d7_k3_d_1,800000).
original_vi_text(d7_k3_d_1,"Điều khiển xe không đi bên phải theo chiều đi của mình").

rule(d7_k3_d_2).
rule_type(d7_k3_d_2,primary_violation).
article(d7_k3_d_2,7).
clause(d7_k3_d_2,3).
point(d7_k3_d_2,"d").
subject(d7_k3_d_2,motorbike).
action(d7_k3_d_2,go_no_stop_phan_road_lane_road_quy_dinh_lane_cung_beam_hoac_lane).
fine_min(d7_k3_d_2,600000).
fine_max(d7_k3_d_2,800000).
original_vi_text(d7_k3_d_2,"đi không đúng phần đường, làn đường quy định (làn cùng chiều hoặc làn ngược chiều)").

rule(d7_k3_d_3).
rule_type(d7_k3_d_3,primary_violation).
article(d7_k3_d_3,7).
clause(d7_k3_d_3,3).
point(d7_k3_d_3,"d").
subject(d7_k3_d_3,motorbike).
action(d7_k3_d_3,dieu_khien_vehicle_go_qua_belt_phan_cach_co_dinh_car_giua_hai_phan).
fine_min(d7_k3_d_3,600000).
fine_max(d7_k3_d_3,800000).
original_vi_text(d7_k3_d_3,"điều khiển xe đi qua dải phân cách cố định ở giữa hai phần đường xe chạy").

rule(d7_k3_dd).
rule_type(d7_k3_dd,primary_violation).
article(d7_k3_dd,7).
clause(d7_k3_dd,3).
point(d7_k3_dd,"dd").
subject(d7_k3_dd,motorbike).
action(d7_k3_dd,overtake_ben_right_trong_truong_hop_no_duoc_permit).
fine_min(d7_k3_dd,600000).
fine_max(d7_k3_dd,800000).
original_vi_text(d7_k3_dd,"Vượt bên phải trong trường hợp không được phép").

rule(d7_k3_e_1).
rule_type(d7_k3_e_1,primary_violation).
article(d7_k3_e_1,7).
clause(d7_k3_e_1,3).
point(d7_k3_e_1,"e").
subject(d7_k3_e_1,motorbike).
action(d7_k3_e_1,nguoi_dang_dieu_khien_vehicle_hoac_cho_nguoi_ngoi_tren_vehicle_bam_keo_belt).
fine_min(d7_k3_e_1,600000).
fine_max(d7_k3_e_1,800000).
original_vi_text(d7_k3_e_1,"Người đang điều khiển xe hoặc chở người ngồi trên xe bám, kéo, đẩy xe khác, vật khác, dẫn dắt vật nuôi, mang vác vật cồng kềnh").

rule(d7_k3_e_2).
rule_type(d7_k3_e_2,primary_violation).
article(d7_k3_e_2,7).
clause(d7_k3_e_2,3).
point(d7_k3_e_2,"e").
subject(d7_k3_e_2,motorbike).
action(d7_k3_e_2,cho_nguoi_stop_tren_yen_gia_deo_hang_hoac_ngoi_tren_tay_lai_cua).
fine_min(d7_k3_e_2,600000).
fine_max(d7_k3_e_2,800000).
original_vi_text(d7_k3_e_2,"chở người đứng trên yên, giá đèo hàng hoặc ngồi trên tay lái của xe").

rule(d7_k3_g).
rule_type(d7_k3_g,primary_violation).
article(d7_k3_g,7).
clause(d7_k3_g,3).
point(d7_k3_g,"g").
subject(d7_k3_g,motorbike).
action(d7_k3_g,dieu_khien_vehicle_keo_theo_vehicle_khac_vat_khac).
fine_min(d7_k3_g,600000).
fine_max(d7_k3_g,800000).
original_vi_text(d7_k3_g,"Điều khiển xe kéo theo xe khác, vật khác").

rule(d7_k3_h).
rule_type(d7_k3_h,primary_violation).
article(d7_k3_h,7).
clause(d7_k3_h,3).
point(d7_k3_h,"h").
subject(d7_k3_h,motorbike).
action(d7_k3_h,chay_trong_tunnel_road_bo_no_use_stop_light_beam_sang_near).
context(d7_k3_h,tunnel).
fine_min(d7_k3_h,600000).
fine_max(d7_k3_h,800000).
original_vi_text(d7_k3_h,"Chạy trong hầm đường bộ không sử dụng đèn chiếu sáng gần").

rule(d7_k3_i).
rule_type(d7_k3_i,primary_violation).
article(d7_k3_i,7).
clause(d7_k3_i,3).
point(d7_k3_i,"i").
subject(d7_k3_i,motorbike).
action(d7_k3_i,no_giu_khoang_cach_safe_safety_de_xay_ra_va_cham_voi_vehicle_chay).
fine_min(d7_k3_i,600000).
fine_max(d7_k3_i,800000).
original_vi_text(d7_k3_i,"Không giữ khoảng cách an toàn để xảy ra va chạm với xe chạy liền trước hoặc không giữ khoảng cách theo quy định của biển báo hiệu \"Cự ly tối thiểu giữa hai xe\"").

rule(d7_k3_k).
rule_type(d7_k3_k,primary_violation).
article(d7_k3_k,7).
clause(d7_k3_k,3).
point(d7_k3_k,"k").
subject(d7_k3_k,motorbike).
action(d7_k3_k,dieu_khien_vehicle_chay_residential_hang_ngang_tu_03_vehicle_tro_len).
fine_min(d7_k3_k,600000).
fine_max(d7_k3_k,800000).
original_vi_text(d7_k3_k,"Điều khiển xe chạy dàn hàng ngang từ 03 xe trở lên").

rule(d7_k3_l).
rule_type(d7_k3_l,primary_violation).
article(d7_k3_l,7).
clause(d7_k3_l,3).
point(d7_k3_l,"l").
subject(d7_k3_l,motorbike).
action(d7_k3_l,vehicle_duoc_quyen_priority_priority_lap_dat_use_stop_thiet_bi_phat_tin_signal).
fine_min(d7_k3_l,600000).
fine_max(d7_k3_l,800000).
original_vi_text(d7_k3_l,"Xe được quyền ưu tiên lắp đặt, sử dụng thiết bị phát tín hiệu ưu tiên không đúng quy định hoặc sử dụng thiết bị phát tín hiệu ưu tiên mà không có giấy phép của cơ quan có thẩm quyền cấp hoặc có giấy phép của cơ quan có thẩm quyền cấp nhưng không còn giá trị sử dụng theo quy định").

rule(d7_k4_a).
rule_type(d7_k4_a,primary_violation).
article(d7_k4_a,7).
clause(d7_k4_a,4).
point(d7_k4_a,"a").
subject(d7_k4_a,motorbike).
action(d7_k4_a,speed_over_limit_10_to_20).
fine_min(d7_k4_a,800000).
fine_max(d7_k4_a,1000000).
original_vi_text(d7_k4_a,"Điều khiển xe chạy quá tốc độ quy định từ 10 km/h đến 20 km/h").

rule(d7_k4_b).
rule_type(d7_k4_b,primary_violation).
article(d7_k4_b,7).
clause(d7_k4_b,4).
point(d7_k4_b,"b").
subject(d7_k4_b,motorbike).
action(d7_k4_b,stop_or_park_improperly_in_tunnel).
context(d7_k4_b,tunnel).
fine_min(d7_k4_b,800000).
fine_max(d7_k4_b,1000000).
original_vi_text(d7_k4_b,"Dừng xe, đỗ xe trong hầm đường bộ không đúng nơi quy định").

rule(d7_k4_c).
rule_type(d7_k4_c,primary_violation).
article(d7_k4_c,7).
clause(d7_k4_c,4).
point(d7_k4_c,"c").
subject(d7_k4_c,motorbike).
action(d7_k4_c,overtake_vehicle_trong_nhung_truong_hop_no_duoc_overtake_overtake_vehicle_tai_doan_road).
exception_ref(d7_k4_c,7,3,"dd").
fine_min(d7_k4_c,800000).
fine_max(d7_k4_c,1000000).
original_vi_text(d7_k4_c,"Vượt xe trong những trường hợp không được vượt, vượt xe tại đoạn đường có biển báo hiệu có nội dung cấm vượt đối với loại phương tiện đang điều khiển").

rule(d7_k4_d).
rule_type(d7_k4_d,primary_violation).
article(d7_k4_d,7).
clause(d7_k4_d,4).
point(d7_k4_d,"d").
subject(d7_k4_d,motorbike).
action(d7_k4_d,uturn_in_tunnel).
context(d7_k4_d,tunnel).
fine_min(d7_k4_d,800000).
fine_max(d7_k4_d,1000000).
original_vi_text(d7_k4_d,"Quay đầu xe trong hầm đường bộ").

rule(d7_k4_dd).
rule_type(d7_k4_dd,primary_violation).
article(d7_k4_dd,7).
clause(d7_k4_dd,4).
point(d7_k4_dd,"dd").
subject(d7_k4_dd,motorbike).
action(d7_k4_dd,nguoi_dang_dieu_khien_vehicle_use_stop_car_du_thiet_bi_am_thanh).
fine_min(d7_k4_dd,800000).
fine_max(d7_k4_dd,1000000).
original_vi_text(d7_k4_dd,"Người đang điều khiển xe sử dụng ô (dù), thiết bị âm thanh (").

rule(d7_k5_a).
rule_type(d7_k5_a,primary_violation).
article(d7_k5_a,7).
clause(d7_k5_a,5).
point(d7_k5_a,"a").
subject(d7_k5_a,motorbike).
action(d7_k5_a,dieu_khien_vehicle_co_lien_quan_truc_tiep_light_vu_tai_nan_traffic_traffic).
exception_ref(d7_k5_a,7,9,"c").
fine_min(d7_k5_a,1000000).
fine_max(d7_k5_a,2000000).
original_vi_text(d7_k5_a,"Điều khiển xe có liên quan trực tiếp đến vụ tai nạn giao thông mà không dừng ngay phương tiện, không giữ nguyên hiện trường, không trợ giúp người bị nạn").

rule(d7_k5_b_1).
rule_type(d7_k5_b_1,primary_violation).
article(d7_k5_b_1,7).
clause(d7_k5_b_1,5).
point(d7_k5_b_1,"b").
subject(d7_k5_b_1,motorbike).
action(d7_k5_b_1,change_turn_no_yield_quyen_go_truoc_cho_nguoi_go_bo_vehicle_lane_cua).
fine_min(d7_k5_b_1,1000000).
fine_max(d7_k5_b_1,2000000).
original_vi_text(d7_k5_b_1,"Chuyển hướng không nhường quyền đi trước cho: người đi bộ, xe lăn của người khuyết tật qua đường tại nơi có vạch kẻ đường dành cho người đi bộ").

rule(d7_k5_b_2).
rule_type(d7_k5_b_2,primary_violation).
article(d7_k5_b_2,7).
clause(d7_k5_b_2,5).
point(d7_k5_b_2,"b").
subject(d7_k5_b_2,motorbike).
action(d7_k5_b_2,vehicle_tho_so_dang_go_tren_phan_road_danh_cho_vehicle_tho_so).
fine_min(d7_k5_b_2,1000000).
fine_max(d7_k5_b_2,2000000).
original_vi_text(d7_k5_b_2,"xe thô sơ đang đi trên phần đường dành cho xe thô sơ").

rule(d7_k5_c_1).
rule_type(d7_k5_c_1,primary_violation).
article(d7_k5_c_1,7).
clause(d7_k5_c_1,5).
point(d7_k5_c_1,"c").
subject(d7_k5_c_1,motorbike).
action(d7_k5_c_1,change_turn_no_yield_road_cho_cac_vehicle_go_wrong_beam).
fine_min(d7_k5_c_1,1000000).
fine_max(d7_k5_c_1,2000000).
original_vi_text(d7_k5_c_1,"Chuyển hướng không nhường đường cho: các xe đi ngược chiều").

rule(d7_k5_c_2).
rule_type(d7_k5_c_2,primary_violation).
article(d7_k5_c_2,7).
clause(d7_k5_c_2,5).
point(d7_k5_c_2,"c").
subject(d7_k5_c_2,motorbike).
action(d7_k5_c_2,nguoi_go_bo_vehicle_tho_so_dang_qua_road_tai_noi_no_co_marking).
fine_min(d7_k5_c_2,1000000).
fine_max(d7_k5_c_2,2000000).
original_vi_text(d7_k5_c_2,"người đi bộ, xe thô sơ đang qua đường tại nơi không có vạch kẻ đường cho người đi bộ").

rule(d7_k6_a).
rule_type(d7_k6_a,primary_violation).
article(d7_k6_a,7).
clause(d7_k6_a,6).
point(d7_k6_a,"a").
subject(d7_k6_a,motorbike).
action(d7_k6_a,drive_with_alcohol_level_1).
fine_min(d7_k6_a,2000000).
fine_max(d7_k6_a,3000000).
original_vi_text(d7_k6_a,"Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn nhưng chưa vượt quá 50 miligam/100 mililít máu hoặc chưa vượt quá 0,25 miligam/1 lít khí thở").

rule(d7_k6_b).
rule_type(d7_k6_b,primary_violation).
article(d7_k6_b,7).
clause(d7_k6_b,6).
point(d7_k6_b,"b").
subject(d7_k6_b,motorbike).
action(d7_k6_b,go_enter_khu_vuc_prohibited_road_co_sign_signal_signal_co_noi_stop_prohibited).
exception_ref(d7_k6_b,7,7,"a").
exception_ref(d7_k6_b,7,7,"b").
fine_min(d7_k6_b,2000000).
fine_max(d7_k6_b,3000000).
original_vi_text(d7_k6_b,"Đi vào khu vực cấm, đường có biển báo hiệu có nội dung cấm đi vào đối với loại phương tiện đang điều khiển").

rule(d7_k6_c).
rule_type(d7_k6_c,primary_violation).
article(d7_k6_c,7).
clause(d7_k6_c,6).
point(d7_k6_c,"c").
subject(d7_k6_c,motorbike).
action(d7_k6_c,no_giam_speed_level_hoac_stop_lai_va_yield_road_khi_dieu_khien_vehicle).
fine_min(d7_k6_c,2000000).
fine_max(d7_k6_c,3000000).
original_vi_text(d7_k6_c,"Không giảm tốc độ (hoặc dừng lại) và nhường đường khi điều khiển xe đi từ đường không ưu tiên ra đường ưu tiên, từ đường nhánh ra đường chính").

rule(d7_k6_d_1).
rule_type(d7_k6_d_1,primary_violation).
article(d7_k6_d_1,7).
clause(d7_k6_d_1,6).
point(d7_k6_d_1,"d").
subject(d7_k6_d_1,motorbike).
action(d7_k6_d_1,fail_to_yield_at_non_roundabout_intersection).
fine_min(d7_k6_d_1,2000000).
fine_max(d7_k6_d_1,3000000).
original_vi_text(d7_k6_d_1,"Không giảm tốc độ và nhường đường cho xe đi đến từ bên phải tại nơi đường giao nhau không có báo hiệu đi theo vòng xuyến").

rule(d7_k6_d_2).
rule_type(d7_k6_d_2,primary_violation).
article(d7_k6_d_2,7).
clause(d7_k6_d_2,6).
point(d7_k6_d_2,"d").
subject(d7_k6_d_2,motorbike).
action(d7_k6_d_2,fail_to_yield_at_roundabout).
fine_min(d7_k6_d_2,2000000).
fine_max(d7_k6_d_2,3000000).
original_vi_text(d7_k6_d_2,"không giảm tốc độ và nhường đường cho xe đi đến từ bên trái tại nơi đường giao nhau có báo hiệu đi theo vòng xuyến").

rule(d7_k7_a).
rule_type(d7_k7_a,primary_violation).
article(d7_k7_a,7).
clause(d7_k7_a,7).
point(d7_k7_a,"a").
subject(d7_k7_a,motorbike).
action(d7_k7_a,wrong_way_on_one_way_road).
context(d7_k7_a,no_entry_road).
fine_min(d7_k7_a,4000000).
fine_max(d7_k7_a,6000000).
original_vi_text(d7_k7_a,"Đi ngược chiều của đường một chiều, đi ngược chiều trên đường có biển \"Cấm đi ngược chiều\"").

rule(d7_k7_b).
rule_type(d7_k7_b,primary_violation).
article(d7_k7_b,7).
clause(d7_k7_b,7).
point(d7_k7_b,"b").
subject(d7_k7_b,motorbike).
action(d7_k7_b,enter_expressway).
context(d7_k7_b,expressway).
fine_min(d7_k7_b,4000000).
fine_max(d7_k7_b,6000000).
original_vi_text(d7_k7_b,"Điều khiển xe đi vào đường cao tốc").

rule(d7_k7_c).
rule_type(d7_k7_c,primary_violation).
article(d7_k7_c,7).
clause(d7_k7_c,7).
point(d7_k7_c,"c").
subject(d7_k7_c,motorbike).
action(d7_k7_c,disobey_traffic_light).
fine_min(d7_k7_c,4000000).
fine_max(d7_k7_c,6000000).
original_vi_text(d7_k7_c,"Không chấp hành hiệu lệnh của đèn tín hiệu giao thông").

rule(d7_k7_d).
rule_type(d7_k7_d,primary_violation).
article(d7_k7_d,7).
clause(d7_k7_d,7).
point(d7_k7_d,"d").
subject(d7_k7_d,motorbike).
action(d7_k7_d,disobey_traffic_controller).
fine_min(d7_k7_d,4000000).
fine_max(d7_k7_d,6000000).
original_vi_text(d7_k7_d,"Không chấp hành hiệu lệnh, hướng dẫn của người điều khiển giao thông hoặc người kiểm soát giao thông").

rule(d7_k7_dd).
rule_type(d7_k7_dd,primary_violation).
article(d7_k7_dd,7).
clause(d7_k7_dd,7).
point(d7_k7_dd,"dd").
subject(d7_k7_dd,motorbike).
action(d7_k7_dd,fail_to_yield_to_priority_vehicle).
fine_min(d7_k7_dd,4000000).
fine_max(d7_k7_dd,6000000).
original_vi_text(d7_k7_dd,"Không nhường đường hoặc gây cản trở xe được quyền ưu tiên đang phát tín hiệu ưu tiên đi làm nhiệm vụ").

rule(d7_k8_a).
rule_type(d7_k8_a,primary_violation).
article(d7_k8_a,7).
clause(d7_k8_a,8).
point(d7_k8_a,"a").
subject(d7_k8_a,motorbike).
action(d7_k8_a,speed_over_limit_over_20).
fine_min(d7_k8_a,6000000).
fine_max(d7_k8_a,8000000).
original_vi_text(d7_k8_a,"Điều khiển xe chạy quá tốc độ quy định trên 20 km/h").

rule(d7_k8_b).
rule_type(d7_k8_b,primary_violation).
article(d7_k8_b,7).
clause(d7_k8_b,8).
point(d7_k8_b,"b").
subject(d7_k8_b,motorbike).
action(d7_k8_b,drive_with_alcohol_level_2).
fine_min(d7_k8_b,6000000).
fine_max(d7_k8_b,8000000).
original_vi_text(d7_k8_b,"Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn vượt quá 50 miligam đến 80 miligam/100 mililít máu hoặc vượt quá 0,25 miligam đến 0,4 miligam/1 lít khí thở").

rule(d7_k9_a_1).
rule_type(d7_k9_a_1,primary_violation).
article(d7_k9_a_1,7).
clause(d7_k9_a_1,9).
point(d7_k9_a_1,"a").
subject(d7_k9_a_1,motorbike).
action(d7_k9_a_1,swerving_or_zigzag_driving).
fine_min(d7_k9_a_1,8000000).
fine_max(d7_k9_a_1,10000000).
original_vi_text(d7_k9_a_1,"Điều khiển xe lạng lách, đánh võng trên đường bộ").

rule(d7_k9_a_2).
rule_type(d7_k9_a_2,primary_violation).
article(d7_k9_a_2,7).
clause(d7_k9_a_2,9).
point(d7_k9_a_2,"a").
subject(d7_k9_a_2,motorbike).
action(d7_k9_a_2,use_stop_chan_chong_hoac_vat_khac_quet_xuong_road_khi_vehicle_dang_chay).
fine_min(d7_k9_a_2,8000000).
fine_max(d7_k9_a_2,10000000).
original_vi_text(d7_k9_a_2,"sử dụng chân chống hoặc vật khác quệt xuống đường khi xe đang chạy").

rule(d7_k9_b).
rule_type(d7_k9_b,primary_violation).
article(d7_k9_b,7).
clause(d7_k9_b,9).
point(d7_k9_b,"b").
subject(d7_k9_b,motorbike).
action(d7_k9_b,dieu_khien_vehicle_thanh_nhom_tu_02_vehicle_tro_len_chay_qua_speed_level).
fine_min(d7_k9_b,8000000).
fine_max(d7_k9_b,10000000).
original_vi_text(d7_k9_b,"Điều khiển xe thành nhóm từ 02 xe trở lên chạy quá tốc độ quy định").

rule(d7_k9_c).
rule_type(d7_k9_c,primary_violation).
article(d7_k9_c,7).
clause(d7_k9_c,9).
point(d7_k9_c,"c").
subject(d7_k9_c,motorbike).
action(d7_k9_c,gay_tai_nan_traffic_traffic_no_stop_ngay_phuong_priority_no_giu_nguyen_hien).
fine_min(d7_k9_c,8000000).
fine_max(d7_k9_c,10000000).
original_vi_text(d7_k9_c,"Gây tai nạn giao thông không dừng ngay phương tiện, không giữ nguyên hiện trường, không trợ giúp người bị nạn, không ở lại hiện trường hoặc không đến trình báo ngay với cơ quan công an, Ủy ban nhân dân nơi gần nhất").

rule(d7_k9_d).
rule_type(d7_k9_d,primary_violation).
article(d7_k9_d,7).
clause(d7_k9_d,9).
point(d7_k9_d,"d").
subject(d7_k9_d,motorbike).
action(d7_k9_d,drive_with_alcohol_level_3).
fine_min(d7_k9_d,8000000).
fine_max(d7_k9_d,10000000).
original_vi_text(d7_k9_d,"Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn vượt quá 80 miligam/100 mililít máu hoặc vượt quá 0,4 miligam/1 lít khí thở").

rule(d7_k9_dd).
rule_type(d7_k9_dd,primary_violation).
article(d7_k9_dd,7).
clause(d7_k9_dd,9).
point(d7_k9_dd,"dd").
subject(d7_k9_dd,motorbike).
action(d7_k9_dd,refuse_alcohol_test).
fine_min(d7_k9_dd,8000000).
fine_max(d7_k9_dd,10000000).
original_vi_text(d7_k9_dd,"Không chấp hành yêu cầu kiểm tra về nồng độ cồn của người thi hành công vụ").

rule(d7_k9_e).
rule_type(d7_k9_e,primary_violation).
article(d7_k9_e,7).
clause(d7_k9_e,9).
point(d7_k9_e,"e").
subject(d7_k9_e,motorbike).
action(d7_k9_e,drive_with_drugs).
fine_min(d7_k9_e,8000000).
fine_max(d7_k9_e,10000000).
original_vi_text(d7_k9_e,"Điều khiển xe trên đường mà trong cơ thể có chất ma túy hoặc chất kích thích khác mà pháp luật cấm sử dụng").

rule(d7_k9_g).
rule_type(d7_k9_g,primary_violation).
article(d7_k9_g,7).
clause(d7_k9_g,9).
point(d7_k9_g,"g").
subject(d7_k9_g,motorbike).
action(d7_k9_g,refuse_drug_test).
fine_min(d7_k9_g,8000000).
fine_max(d7_k9_g,10000000).
original_vi_text(d7_k9_g,"Không chấp hành yêu cầu kiểm tra về chất ma túy hoặc chất kích thích khác mà pháp luật cấm sử dụng của người thi hành công vụ").

rule(d7_k9_h).
rule_type(d7_k9_h,primary_violation).
article(d7_k9_h,7).
clause(d7_k9_h,9).
point(d7_k9_h,"h").
subject(d7_k9_h,motorbike).
action(d7_k9_h,ngoi_phia_sau_vong_tay_qua_nguoi_ngoi_truoc_de_dieu_khien_vehicle).
fine_min(d7_k9_h,8000000).
fine_max(d7_k9_h,10000000).
original_vi_text(d7_k9_h,"Ngồi phía sau vòng tay qua người ngồi trước để điều khiển xe").

rule(d7_k9_i).
rule_type(d7_k9_i,primary_violation).
article(d7_k9_i,7).
clause(d7_k9_i,9).
point(d7_k9_i,"i").
subject(d7_k9_i,motorbike).
action(d7_k9_i,dieu_khien_vehicle_thanh_doan_gay_can_tro_traffic_traffic).
fine_min(d7_k9_i,8000000).
fine_max(d7_k9_i,10000000).
original_vi_text(d7_k9_i,"Điều khiển xe thành đoàn gây cản trở giao thông").

rule(d7_k9_k).
rule_type(d7_k9_k,primary_violation).
article(d7_k9_k,7).
clause(d7_k9_k,9).
point(d7_k9_k,"k").
subject(d7_k9_k,motorbike).
action(d7_k9_k,use_stop_horn_ru_ga_net_po_lien_tuc_trong_khu_dong_residential_residential).
context(d7_k9_k,residential_area).
context(d7_k9_k,hospital_zone).
fine_min(d7_k9_k,8000000).
fine_max(d7_k9_k,10000000).
original_vi_text(d7_k9_k,"Sử dụng còi, rú ga (nẹt pô) liên tục trong khu đông dân cư, khu vực cơ sở khám bệnh, chữa bệnh").

rule(d7_k10_a_1).
rule_type(d7_k10_a_1,primary_violation).
article(d7_k10_a_1,7).
clause(d7_k10_a_1,10).
point(d7_k10_a_1,"a").
subject(d7_k10_a_1,motorbike).
action(d7_k10_a_1,dieu_khien_vehicle_no_quan_close_giam_speed_level_hoac_stop_lai_de_signal).
fine_min(d7_k10_a_1,10000000).
fine_max(d7_k10_a_1,14000000).
original_vi_text(d7_k10_a_1,"Điều khiển xe không quan sát, giảm tốc độ hoặc dừng lại để bảo đảm an toàn theo quy định mà gây tai nạn giao thông").

rule(d7_k10_a_2).
rule_type(d7_k10_a_2,primary_violation).
article(d7_k10_a_2,7).
clause(d7_k10_a_2,10).
point(d7_k10_a_2,"a").
subject(d7_k10_a_2,motorbike).
action(d7_k10_a_2,dieu_khien_vehicle_chay_qua_speed_level_quy_dinh_gay_tai_nan_traffic_traffic).
fine_min(d7_k10_a_2,10000000).
fine_max(d7_k10_a_2,14000000).
original_vi_text(d7_k10_a_2,"điều khiển xe chạy quá tốc độ quy định gây tai nạn giao thông").

rule(d7_k10_a_3).
rule_type(d7_k10_a_3,primary_violation).
article(d7_k10_a_3,7).
clause(d7_k10_a_3,10).
point(d7_k10_a_3,"a").
subject(d7_k10_a_3,motorbike).
action(d7_k10_a_3,enter_expressway).
context(d7_k10_a_3,expressway).
fine_min(d7_k10_a_3,10000000).
fine_max(d7_k10_a_3,14000000).
original_vi_text(d7_k10_a_3,"đi vào đường cao tốc, dừng xe, đỗ xe, quay đầu xe, lùi xe, vượt xe, chuyển hướng, chuyển làn đường không đúng quy định gây tai nạn giao thông").

rule(d7_k10_a_4).
rule_type(d7_k10_a_4,primary_violation).
article(d7_k10_a_4,7).
clause(d7_k10_a_4,10).
point(d7_k10_a_4,"a").
subject(d7_k10_a_4,motorbike).
action(d7_k10_a_4,wrong_way_on_one_way_road).
context(d7_k10_a_4,no_entry_road).
fine_min(d7_k10_a_4,10000000).
fine_max(d7_k10_a_4,14000000).
original_vi_text(d7_k10_a_4,"không đi đúng phần đường, làn đường, không giữ khoảng cách an toàn giữa hai xe theo quy định gây tai nạn giao thông hoặc đi vào đường có biển báo hiệu có nội dung cấm đi vào đối với loại phương tiện đang điều khiển, đi ngược chiều của đường một chiều, đi ngược chiều trên đường có biển \"Cấm đi ngược chiều\" gây tai nạn giao thông").

rule(d7_k10_b_1).
rule_type(d7_k10_b_1,primary_violation).
article(d7_k10_b_1,7).
clause(d7_k10_b_1,10).
point(d7_k10_b_1,"b").
subject(d7_k10_b_1,motorbike).
action(d7_k10_b_1,vi_pham_quy_dinh_tai_mot_trong_cac_diem_khoan_sau_cua_dieu_nay).
fine_min(d7_k10_b_1,10000000).
fine_max(d7_k10_b_1,14000000).
original_vi_text(d7_k10_b_1,"Vi phạm quy định tại một trong các điểm, khoản sau của Điều này mà gây tai nạn giao thông: điểm a, điểm d, điểm đ, điểm g, điểm h, điểm i, điểm k khoản 1").

rule(d7_k10_b_2).
rule_type(d7_k10_b_2,primary_violation).
article(d7_k10_b_2,7).
clause(d7_k10_b_2,10).
point(d7_k10_b_2,"b").
subject(d7_k10_b_2,motorbike).
action(d7_k10_b_2,diem_c_diem_d_diem_g_khoan_2).
fine_min(d7_k10_b_2,10000000).
fine_max(d7_k10_b_2,14000000).
original_vi_text(d7_k10_b_2,"điểm c, điểm đ, điểm g khoản 2").

rule(d7_k10_b_3).
rule_type(d7_k10_b_3,primary_violation).
article(d7_k10_b_3,7).
clause(d7_k10_b_3,10).
point(d7_k10_b_3,"b").
subject(d7_k10_b_3,motorbike).
action(d7_k10_b_3,diem_b_diem_e_diem_g_diem_h_diem_k_khoan_3).
fine_min(d7_k10_b_3,10000000).
fine_max(d7_k10_b_3,14000000).
original_vi_text(d7_k10_b_3,"điểm b, điểm e, điểm g, điểm h, điểm k khoản 3").

rule(d7_k10_b_4).
rule_type(d7_k10_b_4,primary_violation).
article(d7_k10_b_4,7).
clause(d7_k10_b_4,10).
point(d7_k10_b_4,"b").
subject(d7_k10_b_4,motorbike).
action(d7_k10_b_4,diem_d_khoan_4).
fine_min(d7_k10_b_4,10000000).
fine_max(d7_k10_b_4,14000000).
original_vi_text(d7_k10_b_4,"điểm đ khoản 4").

rule(d7_k10_b_5).
rule_type(d7_k10_b_5,primary_violation).
article(d7_k10_b_5,7).
clause(d7_k10_b_5,10).
point(d7_k10_b_5,"b").
subject(d7_k10_b_5,motorbike).
action(d7_k10_b_5,diem_c_diem_d_khoan_6).
fine_min(d7_k10_b_5,10000000).
fine_max(d7_k10_b_5,14000000).
original_vi_text(d7_k10_b_5,"điểm c, điểm d khoản 6").

rule(d7_k10_b_6).
rule_type(d7_k10_b_6,primary_violation).
article(d7_k10_b_6,7).
clause(d7_k10_b_6,10).
point(d7_k10_b_6,"b").
subject(d7_k10_b_6,motorbike).
action(d7_k10_b_6,diem_c_diem_d_diem_d_khoan_7).
fine_min(d7_k10_b_6,10000000).
fine_max(d7_k10_b_6,14000000).
original_vi_text(d7_k10_b_6,"điểm c, điểm d, điểm đ khoản 7").

rule(d7_k10_b_7).
rule_type(d7_k10_b_7,primary_violation).
article(d7_k10_b_7,7).
clause(d7_k10_b_7,10).
point(d7_k10_b_7,"b").
subject(d7_k10_b_7,motorbike).
action(d7_k10_b_7,diem_a_diem_b_diem_h_diem_k_khoan_9_dieu_nay).
fine_min(d7_k10_b_7,10000000).
fine_max(d7_k10_b_7,14000000).
original_vi_text(d7_k10_b_7,"điểm a, điểm b, điểm h, điểm k khoản 9 Điều này").

rule(d8_k1_a).
rule_type(d8_k1_a,primary_violation).
article(d8_k1_a,8).
clause(d8_k1_a,1).
point(d8_k1_a,"a").
subject(d8_k1_a,specialized_vehicle).
action(d8_k1_a,disobey_road_signs_or_markings).
fine_min(d8_k1_a,400000).
fine_max(d8_k1_a,600000).
original_vi_text(d8_k1_a,"Không chấp hành hiệu lệnh, chỉ dẫn của biển báo hiệu, vạch kẻ đường").

rule(d8_k1_b).
rule_type(d8_k1_b,primary_violation).
article(d8_k1_b,8).
clause(d8_k1_b,1).
point(d8_k1_b,"b").
subject(d8_k1_b,specialized_vehicle).
action(d8_k1_b,no_hazard_light_or_warning_sign).
exception_ref(d8_k1_b,8,6,"b").
fine_min(d8_k1_b,400000).
fine_max(d8_k1_b,600000).
original_vi_text(d8_k1_b,"Không báo hiệu bằng đèn khẩn cấp hoặc không đặt biển cảnh báo \"Chú ý xe đỗ\" theo quy định trong trường hợp gặp sự cố kỹ thuật (hoặc bất khả kháng khác) buộc phải đỗ xe chiếm một phần đường xe chạy hoặc tại nơi không được phép đỗ xe").

rule(d8_k2_a_1).
rule_type(d8_k2_a_1,primary_violation).
article(d8_k2_a_1,8).
clause(d8_k2_a_1,2).
point(d8_k2_a_1,"a").
subject(d8_k2_a_1,specialized_vehicle).
action(d8_k2_a_1,stop_vehicle_level_vehicle_tren_phan_road_vehicle_chay_car_doan_road_ngoai_level).
context(d8_k2_a_1,roadway).
exception_ref(d8_k2_a_1,8,6,"b").
fine_min(d8_k2_a_1,600000).
fine_max(d8_k2_a_1,800000).
original_vi_text(d8_k2_a_1,"Dừng xe, đỗ xe trên phần đường xe chạy ở đoạn đường ngoài đô thị nơi có lề đường rộng").

rule(d8_k2_a_2).
rule_type(d8_k2_a_2,primary_violation).
article(d8_k2_a_2,8).
clause(d8_k2_a_2,2).
point(d8_k2_a_2,"a").
subject(d8_k2_a_2,specialized_vehicle).
action(d8_k2_a_2,stop_vehicle_level_vehicle_no_close_edge_road_phia_ben_right_theo_beam_go).
exception_ref(d8_k2_a_2,8,6,"b").
fine_min(d8_k2_a_2,600000).
fine_max(d8_k2_a_2,800000).
original_vi_text(d8_k2_a_2,"dừng xe, đỗ xe không sát mép đường phía bên phải theo chiều đi ở nơi đường có lề đường hẹp hoặc không có lề đường").

rule(d8_k2_a_3).
rule_type(d8_k2_a_3,primary_violation).
article(d8_k2_a_3,8).
clause(d8_k2_a_3,2).
point(d8_k2_a_3,"a").
subject(d8_k2_a_3,specialized_vehicle).
action(d8_k2_a_3,stop_vehicle_level_vehicle_wrong_voi_beam_luu_traffic_cua_lane_road).
exception_ref(d8_k2_a_3,8,6,"b").
fine_min(d8_k2_a_3,600000).
fine_max(d8_k2_a_3,800000).
original_vi_text(d8_k2_a_3,"dừng xe, đỗ xe ngược với chiều lưu thông của làn đường").

rule(d8_k2_a_4).
rule_type(d8_k2_a_4,primary_violation).
article(d8_k2_a_4,8).
clause(d8_k2_a_4,2).
point(d8_k2_a_4,"a").
subject(d8_k2_a_4,specialized_vehicle).
action(d8_k2_a_4,stop_vehicle_level_vehicle_tren_belt_phan_cach_co_dinh_car_giua_hai_phan).
exception_ref(d8_k2_a_4,8,6,"b").
fine_min(d8_k2_a_4,600000).
fine_max(d8_k2_a_4,800000).
original_vi_text(d8_k2_a_4,"dừng xe, đỗ xe trên dải phân cách cố định ở giữa hai phần đường xe chạy").

rule(d8_k2_a_5).
rule_type(d8_k2_a_5,primary_violation).
article(d8_k2_a_5,8).
clause(d8_k2_a_5,2).
point(d8_k2_a_5,"a").
subject(d8_k2_a_5,specialized_vehicle).
action(d8_k2_a_5,stop_vehicle_level_vehicle_no_stop_vi_tri_quy_dinh_car_nhung_doan_road).
exception_ref(d8_k2_a_5,8,6,"b").
fine_min(d8_k2_a_5,600000).
fine_max(d8_k2_a_5,800000).
original_vi_text(d8_k2_a_5,"dừng xe, đỗ xe không đúng vị trí quy định ở những đoạn đường đã có bố trí nơi dừng xe, đỗ xe").

rule(d8_k2_a_6).
rule_type(d8_k2_a_6,primary_violation).
article(d8_k2_a_6,8).
clause(d8_k2_a_6,2).
point(d8_k2_a_6,"a").
subject(d8_k2_a_6,specialized_vehicle).
action(d8_k2_a_6,level_vehicle_tren_doc_no_chen_banh).
exception_ref(d8_k2_a_6,8,6,"b").
fine_min(d8_k2_a_6,600000).
fine_max(d8_k2_a_6,800000).
original_vi_text(d8_k2_a_6,"đỗ xe trên dốc không chèn bánh").

rule(d8_k2_a_7).
rule_type(d8_k2_a_7,primary_violation).
article(d8_k2_a_7,8).
clause(d8_k2_a_7,2).
point(d8_k2_a_7,"a").
subject(d8_k2_a_7,specialized_vehicle).
action(d8_k2_a_7,stop_vehicle_noi_co_sign_prohibited_stop_vehicle_va_level_vehicle).
exception_ref(d8_k2_a_7,8,6,"b").
fine_min(d8_k2_a_7,600000).
fine_max(d8_k2_a_7,800000).
original_vi_text(d8_k2_a_7,"dừng xe nơi có biển \"Cấm dừng xe và đỗ xe\"").

rule(d8_k2_a_8).
rule_type(d8_k2_a_8,primary_violation).
article(d8_k2_a_8,8).
clause(d8_k2_a_8,2).
point(d8_k2_a_8,"a").
subject(d8_k2_a_8,specialized_vehicle).
action(d8_k2_a_8,level_vehicle_noi_co_sign_prohibited_level_vehicle_hoac_sign_prohibited_stop_vehicle_va).
exception_ref(d8_k2_a_8,8,6,"b").
fine_min(d8_k2_a_8,600000).
fine_max(d8_k2_a_8,800000).
original_vi_text(d8_k2_a_8,"đỗ xe nơi có biển \"Cấm đỗ xe\" hoặc biển \"Cấm dừng xe và đỗ xe\"").

rule(d8_k2_b_1).
rule_type(d8_k2_b_1,primary_violation).
article(d8_k2_b_1,8).
clause(d8_k2_b_1,2).
point(d8_k2_b_1,"b").
subject(d8_k2_b_1,specialized_vehicle).
action(d8_k2_b_1,stop_vehicle_level_vehicle_tai_cac_vi_tri_ben_left_road_mot_beam_hoac).
exception_ref(d8_k2_b_1,8,6,"b").
fine_min(d8_k2_b_1,600000).
fine_max(d8_k2_b_1,800000).
original_vi_text(d8_k2_b_1,"Dừng xe, đỗ xe tại các vị trí: bên trái đường một chiều hoặc bên trái (theo hướng lưu thông) của đường đôi").

rule(d8_k2_b_2).
rule_type(d8_k2_b_2,primary_violation).
article(d8_k2_b_2,8).
clause(d8_k2_b_2,2).
point(d8_k2_b_2,"b").
subject(d8_k2_b_2,specialized_vehicle).
action(d8_k2_b_2,tren_doan_road_cong_hoac_near_turn_doc_noi_tam_nhin_bi_che_khuat).
exception_ref(d8_k2_b_2,8,6,"b").
fine_min(d8_k2_b_2,600000).
fine_max(d8_k2_b_2,800000).
original_vi_text(d8_k2_b_2,"trên đoạn đường cong hoặc gần đầu dốc nơi tầm nhìn bị che khuất").

rule(d8_k2_b_3).
rule_type(d8_k2_b_3,primary_violation).
article(d8_k2_b_3,8).
clause(d8_k2_b_3,2).
point(d8_k2_b_3,"b").
subject(d8_k2_b_3,specialized_vehicle).
action(d8_k2_b_3,tren_bridge).
context(d8_k2_b_3,bridge).
exception_ref(d8_k2_b_3,8,6,"b").
fine_min(d8_k2_b_3,600000).
fine_max(d8_k2_b_3,800000).
original_vi_text(d8_k2_b_3,"trên cầu (").

rule(d8_k2_c_1).
rule_type(d8_k2_c_1,primary_violation).
article(d8_k2_c_1,8).
clause(d8_k2_c_1,2).
point(d8_k2_c_1,"c").
subject(d8_k2_c_1,specialized_vehicle).
action(d8_k2_c_1,stop_vehicle_level_vehicle_car_long_road_left_quy_dinh).
fine_min(d8_k2_c_1,600000).
fine_max(d8_k2_c_1,800000).
original_vi_text(d8_k2_c_1,"Dừng xe, đỗ xe ở lòng đường trái quy định").

rule(d8_k2_c_2).
rule_type(d8_k2_c_2,primary_violation).
article(d8_k2_c_2,8).
clause(d8_k2_c_2,2).
point(d8_k2_c_2,"c").
subject(d8_k2_c_2,specialized_vehicle).
action(d8_k2_c_2,stop_vehicle_level_vehicle_tren_road_danh_rieng_cho_vehicle_buyt_tren_mieng_cong).
context(d8_k2_c_2,pedestrian_crossing).
context(d8_k2_c_2,bus_lane).
fine_min(d8_k2_c_2,600000).
fine_max(d8_k2_c_2,800000).
original_vi_text(d8_k2_c_2,"dừng xe, đỗ xe trên đường dành riêng cho xe buýt, trên miệng cống thoát nước, miệng hầm của đường điện thoại, điện cao thế, chỗ dành riêng cho xe chữa cháy lấy nước, trên phần đường dành cho người đi bộ qua đường").

rule(d8_k2_c_3).
rule_type(d8_k2_c_3,primary_violation).
article(d8_k2_c_3,8).
clause(d8_k2_c_3,2).
point(d8_k2_c_3,"c").
subject(d8_k2_c_3,specialized_vehicle).
action(d8_k2_c_3,roi_vi_tri_lai_tat_machine_khi_stop_vehicle).
fine_min(d8_k2_c_3,600000).
fine_max(d8_k2_c_3,800000).
original_vi_text(d8_k2_c_3,"rời vị trí lái, tắt máy khi dừng xe (").

rule(d8_k2_d).
rule_type(d8_k2_d,primary_violation).
article(d8_k2_d,8).
clause(d8_k2_d,2).
point(d8_k2_d,"d").
subject(d8_k2_d,specialized_vehicle).
action(d8_k2_d,no_signal_when_entering_or_leaving_parking_position).
fine_min(d8_k2_d,600000).
fine_max(d8_k2_d,800000).
original_vi_text(d8_k2_d,"Khi ra, vào vị trí dừng xe, đỗ xe không có tín hiệu báo cho người điều khiển phương tiện khác biết").

rule(d8_k2_dd).
rule_type(d8_k2_dd,primary_violation).
article(d8_k2_dd,8).
clause(d8_k2_dd,2).
point(d8_k2_dd,"dd").
subject(d8_k2_dd,specialized_vehicle).
action(d8_k2_dd,level_de_vehicle_car_sidewalk_sidewalk_left_permit).
fine_min(d8_k2_dd,600000).
fine_max(d8_k2_dd,800000).
original_vi_text(d8_k2_dd,"Đỗ, để xe ở vỉa hè trái phép").

rule(d8_k3_a).
rule_type(d8_k3_a,primary_violation).
article(d8_k3_a,8).
clause(d8_k3_a,3).
point(d8_k3_a,"a").
subject(d8_k3_a,specialized_vehicle).
action(d8_k3_a,speed_over_limit_5_to_under_10).
fine_min(d8_k3_a,800000).
fine_max(d8_k3_a,1000000).
original_vi_text(d8_k3_a,"Chạy quá tốc độ quy định từ 05 km/h đến dưới 10 km/h").

rule(d8_k3_b_1).
rule_type(d8_k3_b_1,primary_violation).
article(d8_k3_b_1,8).
clause(d8_k3_b_1,3).
point(d8_k3_b_1,"b").
subject(d8_k3_b_1,specialized_vehicle).
action(d8_k3_b_1,use_horn_or_rev_engine_continuously).
fine_min(d8_k3_b_1,800000).
fine_max(d8_k3_b_1,1000000).
original_vi_text(d8_k3_b_1,"Sử dụng còi, rú ga liên tục").

rule(d8_k3_b_2).
rule_type(d8_k3_b_2,primary_violation).
article(d8_k3_b_2,8).
clause(d8_k3_b_2,3).
point(d8_k3_b_2,"b").
subject(d8_k3_b_2,specialized_vehicle).
action(d8_k3_b_2,use_stop_horn_hoi_use_stop_light_beam_high_khi_gap_nguoi_go_bo).
fine_min(d8_k3_b_2,800000).
fine_max(d8_k3_b_2,1000000).
original_vi_text(d8_k3_b_2,"sử dụng còi hơi, sử dụng đèn chiếu xa khi gặp người đi bộ qua đường hoặc khi đi trên đoạn đường qua khu dân cư có hệ thống chiếu sáng đang hoạt động hoặc khi gặp xe đi ngược chiều (").

rule(d8_k3_c).
rule_type(d8_k3_c,primary_violation).
article(d8_k3_c,8).
clause(d8_k3_c,3).
point(d8_k3_c,"c").
subject(d8_k3_c,specialized_vehicle).
action(d8_k3_c,no_use_stop_hoac_use_stop_no_du_light_beam_sang_trong_thoi_gian).
context(d8_k3_c,time_18_to_06).
fine_min(d8_k3_c,800000).
fine_max(d8_k3_c,1000000).
original_vi_text(d8_k3_c,"Không sử dụng hoặc sử dụng không đủ đèn chiếu sáng trong thời gian từ 18 giờ ngày hôm trước đến 06 giờ ngày hôm sau hoặc khi có sương mù, khói, bụi, trời mưa, thời tiết xấu làm hạn chế tầm nhìn").

rule(d8_k3_d_1).
rule_type(d8_k3_d_1,primary_violation).
article(d8_k3_d_1,8).
clause(d8_k3_d_1,3).
point(d8_k3_d_1,"d").
subject(d8_k3_d_1,specialized_vehicle).
action(d8_k3_d_1,tranh_vehicle_overtake_vehicle_no_stop_quy_dinh).
fine_min(d8_k3_d_1,800000).
fine_max(d8_k3_d_1,1000000).
original_vi_text(d8_k3_d_1,"Tránh xe, vượt xe không đúng quy định").

rule(d8_k3_d_2).
rule_type(d8_k3_d_2,primary_violation).
article(d8_k3_d_2,8).
clause(d8_k3_d_2,3).
point(d8_k3_d_2,"d").
subject(d8_k3_d_2,specialized_vehicle).
action(d8_k3_d_2,no_yield_road_cho_vehicle_go_wrong_beam_theo_quy_dinh_tai_noi_road).
fine_min(d8_k3_d_2,800000).
fine_max(d8_k3_d_2,1000000).
original_vi_text(d8_k3_d_2,"không nhường đường cho xe đi ngược chiều theo quy định tại nơi đường hẹp, đường dốc, nơi có chướng ngại vật").

rule(d8_k3_dd).
rule_type(d8_k3_dd,primary_violation).
article(d8_k3_dd,8).
clause(d8_k3_dd,3).
point(d8_k3_dd,"dd").
subject(d8_k3_dd,specialized_vehicle).
action(d8_k3_dd,dieu_khien_vehicle_chay_duoi_speed_level_toi_thieu_tren_doan_road_bo_co).
fine_min(d8_k3_dd,800000).
fine_max(d8_k3_dd,1000000).
original_vi_text(d8_k3_dd,"Điều khiển xe chạy dưới tốc độ tối thiểu trên đoạn đường bộ có quy định tốc độ tối thiểu cho phép").

rule(d8_k4_a).
rule_type(d8_k4_a,primary_violation).
article(d8_k4_a,8).
clause(d8_k4_a,4).
point(d8_k4_a,"a").
subject(d8_k4_a,specialized_vehicle).
action(d8_k4_a,speed_over_limit_10_to_20).
fine_min(d8_k4_a,1000000).
fine_max(d8_k4_a,2000000).
original_vi_text(d8_k4_a,"Chạy quá tốc độ quy định từ 10 km/h đến 20 km/h").

rule(d8_k4_b).
rule_type(d8_k4_b,primary_violation).
article(d8_k4_b,8).
clause(d8_k4_b,4).
point(d8_k4_b,"b").
subject(d8_k4_b,specialized_vehicle).
action(d8_k4_b,chay_vehicle_trong_tunnel_road_bo_no_use_stop_light_beam_sang_near).
context(d8_k4_b,tunnel).
fine_min(d8_k4_b,1000000).
fine_max(d8_k4_b,2000000).
original_vi_text(d8_k4_b,"Chạy xe trong hầm đường bộ không sử dụng đèn chiếu sáng gần").

rule(d8_k4_c_1).
rule_type(d8_k4_c_1,primary_violation).
article(d8_k4_c_1,8).
clause(d8_k4_c_1,4).
point(d8_k4_c_1,"c").
subject(d8_k4_c_1,specialized_vehicle).
action(d8_k4_c_1,no_tuan_thu_cac_quy_dinh_ve_stop_vehicle_level_vehicle_tai_noi_road).
context(d8_k4_c_1,intersection).
context(d8_k4_c_1,railway_crossing).
fine_min(d8_k4_c_1,1000000).
fine_max(d8_k4_c_1,2000000).
original_vi_text(d8_k4_c_1,"Không tuân thủ các quy định về dừng xe, đỗ xe tại nơi đường bộ giao nhau cùng mức với đường sắt").

rule(d8_k4_c_2).
rule_type(d8_k4_c_2,primary_violation).
article(d8_k4_c_2,8).
clause(d8_k4_c_2,4).
point(d8_k4_c_2,"c").
subject(d8_k4_c_2,specialized_vehicle).
action(d8_k4_c_2,stop_vehicle_level_vehicle_trong_pham_vi_signal_ve_cong_trinh_road_close_pham).
fine_min(d8_k4_c_2,1000000).
fine_max(d8_k4_c_2,2000000).
original_vi_text(d8_k4_c_2,"dừng xe, đỗ xe trong phạm vi bảo vệ công trình đường sắt, phạm vi an toàn của đường sắt").

rule(d8_k4_d_1).
rule_type(d8_k4_d_1,primary_violation).
article(d8_k4_d_1,8).
clause(d8_k4_d_1,4).
point(d8_k4_d_1,"d").
subject(d8_k4_d_1,specialized_vehicle).
action(d8_k4_d_1,u_turn_turn_vehicle_tai_noi_road_bo_traffic_nhau_cung_muc_voi_road_close).
context(d8_k4_d_1,intersection).
context(d8_k4_d_1,railway_crossing).
fine_min(d8_k4_d_1,1000000).
fine_max(d8_k4_d_1,2000000).
original_vi_text(d8_k4_d_1,"Quay đầu xe tại nơi đường bộ giao nhau cùng mức với đường sắt").

rule(d8_k4_d_2).
rule_type(d8_k4_d_2,primary_violation).
article(d8_k4_d_2,8).
clause(d8_k4_d_2,4).
point(d8_k4_d_2,"d").
subject(d8_k4_d_2,specialized_vehicle).
action(d8_k4_d_2,u_turn_turn_vehicle_tai_noi_road_hep_road_doc_doan_road_cong_tam_nhin).
fine_min(d8_k4_d_2,1000000).
fine_max(d8_k4_d_2,2000000).
original_vi_text(d8_k4_d_2,"quay đầu xe tại nơi đường hẹp, đường dốc, đoạn đường cong tầm nhìn bị che khuất, nơi có biển báo hiệu có nội dung cấm quay đầu đối với loại phương tiện đang điều khiển").

rule(d8_k4_d_3).
rule_type(d8_k4_d_3,primary_violation).
article(d8_k4_d_3,8).
clause(d8_k4_d_3,4).
point(d8_k4_d_3,"d").
subject(d8_k4_d_3,specialized_vehicle).
action(d8_k4_d_3,dieu_khien_vehicle_turn_left_tai_noi_co_sign_signal_signal_co_noi_stop).
fine_min(d8_k4_d_3,1000000).
fine_max(d8_k4_d_3,2000000).
original_vi_text(d8_k4_d_3,"điều khiển xe rẽ trái tại nơi có biển báo hiệu có nội dung cấm rẽ trái đối với loại phương tiện đang điều khiển").

rule(d8_k4_d_4).
rule_type(d8_k4_d_4,primary_violation).
article(d8_k4_d_4,8).
clause(d8_k4_d_4,4).
point(d8_k4_d_4,"d").
subject(d8_k4_d_4,specialized_vehicle).
action(d8_k4_d_4,dieu_khien_vehicle_turn_right_tai_noi_co_sign_signal_signal_co_noi_stop).
fine_min(d8_k4_d_4,1000000).
fine_max(d8_k4_d_4,2000000).
original_vi_text(d8_k4_d_4,"điều khiển xe rẽ phải tại nơi có biển báo hiệu có nội dung cấm rẽ phải đối với loại phương tiện đang điều khiển").

rule(d8_k4_dd).
rule_type(d8_k4_dd,primary_violation).
article(d8_k4_dd,8).
clause(d8_k4_dd,4).
point(d8_k4_dd,"dd").
subject(d8_k4_dd,specialized_vehicle).
action(d8_k4_dd,u_turn_turn_vehicle_car_phan_road_danh_cho_nguoi_go_bo_qua_road_tren).
context(d8_k4_dd,bridge).
fine_min(d8_k4_dd,1000000).
fine_max(d8_k4_dd,2000000).
original_vi_text(d8_k4_dd,"Quay đầu xe ở phần đường dành cho người đi bộ qua đường, trên cầu, đầu cầu, ngầm, gầm cầu vượt").

rule(d8_k4_e_1).
rule_type(d8_k4_e_1,primary_violation).
article(d8_k4_e_1,8).
clause(d8_k4_e_1,4).
point(d8_k4_e_1,"e").
subject(d8_k4_e_1,specialized_vehicle).
action(d8_k4_e_1,reverse_vehicle_car_road_mot_beam_road_co_sign_prohibited_go_wrong_beam_khu).
context(d8_k4_e_1,pedestrian_crossing).
fine_min(d8_k4_e_1,1000000).
fine_max(d8_k4_e_1,2000000).
original_vi_text(d8_k4_e_1,"Lùi xe ở đường một chiều, đường có biển \"Cấm đi ngược chiều\", khu vực cấm dừng, trên phần đường dành cho người đi bộ qua đường, nơi đường bộ giao nhau, đường bộ giao nhau cùng mức với đường sắt, nơi tầm nhìn bị che khuất").

rule(d8_k4_e_2).
rule_type(d8_k4_e_2,primary_violation).
article(d8_k4_e_2,8).
clause(d8_k4_e_2,4).
point(d8_k4_e_2,"e").
subject(d8_k4_e_2,specialized_vehicle).
action(d8_k4_e_2,reverse_vehicle_no_quan_close_hai_ben_va_phia_sau_vehicle_hoac_no_co).
fine_min(d8_k4_e_2,1000000).
fine_max(d8_k4_e_2,2000000).
original_vi_text(d8_k4_e_2,"lùi xe không quan sát hai bên và phía sau xe hoặc không có tín hiệu lùi xe").

rule(d8_k5_a).
rule_type(d8_k5_a,primary_violation).
article(d8_k5_a,8).
clause(d8_k5_a,5).
point(d8_k5_a,"a").
subject(d8_k5_a,specialized_vehicle).
action(d8_k5_a,uturn_in_tunnel).
context(d8_k5_a,tunnel).
fine_min(d8_k5_a,2000000).
fine_max(d8_k5_a,3000000).
original_vi_text(d8_k5_a,"Lùi xe, quay đầu xe trong hầm đường bộ").

rule(d8_k5_b).
rule_type(d8_k5_b,primary_violation).
article(d8_k5_b,8).
clause(d8_k5_b,5).
point(d8_k5_b,"b").
subject(d8_k5_b,specialized_vehicle).
action(d8_k5_b,no_thuc_hien_sign_phap_signal_dam_safe_safety_theo_quy_dinh_khi_phuong).
fine_min(d8_k5_b,2000000).
fine_max(d8_k5_b,3000000).
original_vi_text(d8_k5_b,"Không thực hiện biện pháp bảo đảm an toàn theo quy định khi phương tiện bị hư hỏng trên đoạn đường bộ giao nhau cùng mức với đường sắt").

rule(d8_k5_c_1).
rule_type(d8_k5_c_1,primary_violation).
article(d8_k5_c_1,8).
clause(d8_k5_c_1,5).
point(d8_k5_c_1,"c").
subject(d8_k5_c_1,specialized_vehicle).
action(d8_k5_c_1,stop_or_park_improperly_in_tunnel).
context(d8_k5_c_1,tunnel).
fine_min(d8_k5_c_1,2000000).
fine_max(d8_k5_c_1,3000000).
original_vi_text(d8_k5_c_1,"Dừng xe, đỗ xe trong hầm đường bộ không đúng nơi quy định").

rule(d8_k5_c_2).
rule_type(d8_k5_c_2,primary_violation).
article(d8_k5_c_2,8).
clause(d8_k5_c_2,5).
point(d8_k5_c_2,"c").
subject(d8_k5_c_2,specialized_vehicle).
action(d8_k5_c_2,no_co_signal_signal_bang_light_emergency_emergency_no_dat_sign_canh_signal_chu).
context(d8_k5_c_2,tunnel).
fine_min(d8_k5_c_2,2000000).
fine_max(d8_k5_c_2,3000000).
original_vi_text(d8_k5_c_2,"không có báo hiệu bằng đèn khẩn cấp, không đặt biển cảnh báo \"Chú ý xe đỗ\" (hoặc đèn cảnh báo) về phía sau xe khoảng cách đảm bảo an toàn khi dừng xe, đỗ xe trong hầm đường bộ trong trường hợp gặp sự cố kỹ thuật hoặc bất khả kháng khác buộc phải dừng xe, đỗ xe").

rule(d8_k5_d).
rule_type(d8_k5_d,primary_violation).
article(d8_k5_d,8).
clause(d8_k5_d,5).
point(d8_k5_d,"d").
subject(d8_k5_d,specialized_vehicle).
action(d8_k5_d,dieu_khien_vehicle_co_lien_quan_truc_tiep_light_vu_tai_nan_traffic_traffic).
exception_ref(d8_k5_d,8,8,"c").
fine_min(d8_k5_d,2000000).
fine_max(d8_k5_d,3000000).
original_vi_text(d8_k5_d,"Điều khiển xe có liên quan trực tiếp đến vụ tai nạn giao thông mà không dừng ngay phương tiện, không giữ nguyên hiện trường, không trợ giúp người bị nạn").

rule(d8_k5_dd_1).
rule_type(d8_k5_dd_1,primary_violation).
article(d8_k5_dd_1,8).
clause(d8_k5_dd_1,5).
point(d8_k5_dd_1,"dd").
subject(d8_k5_dd_1,specialized_vehicle).
action(d8_k5_dd_1,change_turn_no_yield_quyen_go_truoc_cho_nguoi_go_bo_vehicle_lane_cua).
fine_min(d8_k5_dd_1,2000000).
fine_max(d8_k5_dd_1,3000000).
original_vi_text(d8_k5_dd_1,"Chuyển hướng không nhường quyền đi trước cho: người đi bộ, xe lăn của người khuyết tật qua đường tại nơi có vạch kẻ đường dành cho người đi bộ").

rule(d8_k5_dd_2).
rule_type(d8_k5_dd_2,primary_violation).
article(d8_k5_dd_2,8).
clause(d8_k5_dd_2,5).
point(d8_k5_dd_2,"dd").
subject(d8_k5_dd_2,specialized_vehicle).
action(d8_k5_dd_2,vehicle_tho_so_dang_go_tren_phan_road_danh_cho_vehicle_tho_so).
fine_min(d8_k5_dd_2,2000000).
fine_max(d8_k5_dd_2,3000000).
original_vi_text(d8_k5_dd_2,"xe thô sơ đang đi trên phần đường dành cho xe thô sơ").

rule(d8_k5_e_1).
rule_type(d8_k5_e_1,primary_violation).
article(d8_k5_e_1,8).
clause(d8_k5_e_1,5).
point(d8_k5_e_1,"e").
subject(d8_k5_e_1,specialized_vehicle).
action(d8_k5_e_1,change_turn_no_yield_road_cho_cac_vehicle_go_wrong_beam).
fine_min(d8_k5_e_1,2000000).
fine_max(d8_k5_e_1,3000000).
original_vi_text(d8_k5_e_1,"Chuyển hướng không nhường đường cho: các xe đi ngược chiều").

rule(d8_k5_e_2).
rule_type(d8_k5_e_2,primary_violation).
article(d8_k5_e_2,8).
clause(d8_k5_e_2,5).
point(d8_k5_e_2,"e").
subject(d8_k5_e_2,specialized_vehicle).
action(d8_k5_e_2,nguoi_go_bo_vehicle_tho_so_dang_qua_road_tai_noi_no_co_marking).
fine_min(d8_k5_e_2,2000000).
fine_max(d8_k5_e_2,3000000).
original_vi_text(d8_k5_e_2,"người đi bộ, xe thô sơ đang qua đường tại nơi không có vạch kẻ đường cho người đi bộ").

rule(d8_k6_a).
rule_type(d8_k6_a,primary_violation).
article(d8_k6_a,8).
clause(d8_k6_a,6).
point(d8_k6_a,"a").
subject(d8_k6_a,specialized_vehicle).
action(d8_k6_a,speed_over_limit_over_20).
fine_min(d8_k6_a,3000000).
fine_max(d8_k6_a,5000000).
original_vi_text(d8_k6_a,"Chạy quá tốc độ quy định trên 20 km/h").

rule(d8_k6_b_1).
rule_type(d8_k6_b_1,primary_violation).
article(d8_k6_b_1,8).
clause(d8_k6_b_1,6).
point(d8_k6_b_1,"b").
subject(d8_k6_b_1,specialized_vehicle).
action(d8_k6_b_1,stop_vehicle_level_vehicle_tren_road_highway_speed_no_stop_noi_quy_dinh).
context(d8_k6_b_1,expressway).
fine_min(d8_k6_b_1,3000000).
fine_max(d8_k6_b_1,5000000).
original_vi_text(d8_k6_b_1,"Dừng xe, đỗ xe trên đường cao tốc không đúng nơi quy định").

rule(d8_k6_b_2).
rule_type(d8_k6_b_2,primary_violation).
article(d8_k6_b_2,8).
clause(d8_k6_b_2,6).
point(d8_k6_b_2,"b").
subject(d8_k6_b_2,specialized_vehicle).
action(d8_k6_b_2,no_co_signal_signal_bang_light_emergency_emergency_khi_gap_use_co_ky_thuat).
context(d8_k6_b_2,expressway).
fine_min(d8_k6_b_2,3000000).
fine_max(d8_k6_b_2,5000000).
original_vi_text(d8_k6_b_2,"không có báo hiệu bằng đèn khẩn cấp khi gặp sự cố kỹ thuật hoặc bất khả kháng khác buộc phải dừng xe, đỗ xe ở làn dừng xe khẩn cấp trên đường cao tốc").

rule(d8_k6_b_3).
rule_type(d8_k6_b_3,primary_violation).
article(d8_k6_b_3,8).
clause(d8_k6_b_3,6).
point(d8_k6_b_3,"b").
subject(d8_k6_b_3,specialized_vehicle).
action(d8_k6_b_3,no_co_signal_signal_bang_light_emergency_emergency_no_dat_sign_canh_signal_chu).
context(d8_k6_b_3,expressway).
fine_min(d8_k6_b_3,3000000).
fine_max(d8_k6_b_3,5000000).
original_vi_text(d8_k6_b_3,"không có báo hiệu bằng đèn khẩn cấp, không đặt biển cảnh báo \"Chú ý xe đỗ\" (hoặc đèn cảnh báo) về phía sau xe khoảng cách tối thiểu 150 mét khi gặp sự cố kỹ thuật hoặc bất khả kháng khác buộc phải dừng xe, đỗ xe trên một phần làn đường xe chạy trên đường cao tốc").

rule(d8_k6_c).
rule_type(d8_k6_c,primary_violation).
article(d8_k6_c,8).
clause(d8_k6_c,6).
point(d8_k6_c,"c").
subject(d8_k6_c,specialized_vehicle).
action(d8_k6_c,drive_with_alcohol_level_1).
fine_min(d8_k6_c,3000000).
fine_max(d8_k6_c,5000000).
original_vi_text(d8_k6_c,"Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn nhưng chưa vượt quá 50 miligam/100 mililít máu hoặc chưa vượt quá 0,25 miligam/1 lít khí thở").

rule(d8_k6_d).
rule_type(d8_k6_d,primary_violation).
article(d8_k6_d,8).
clause(d8_k6_d,6).
point(d8_k6_d,"d").
subject(d8_k6_d,specialized_vehicle).
action(d8_k6_d,go_enter_khu_vuc_prohibited_road_co_sign_signal_signal_co_noi_stop_prohibited).
exception_ref(d8_k6_d,8,7,"d").
exception_ref(d8_k6_d,8,7,"dd").
fine_min(d8_k6_d,3000000).
fine_max(d8_k6_d,5000000).
original_vi_text(d8_k6_d,"Đi vào khu vực cấm, đường có biển báo hiệu có nội dung cấm đi vào đối với loại phương tiện đang điều khiển").

rule(d8_k6_dd_1).
rule_type(d8_k6_dd_1,primary_violation).
article(d8_k6_dd_1,8).
clause(d8_k6_dd_1,6).
point(d8_k6_dd_1,"dd").
subject(d8_k6_dd_1,specialized_vehicle).
action(d8_k6_dd_1,no_go_ben_right_theo_beam_go_cua_minh).
exception_ref(d8_k6_dd_1,8,6,"e").
exception_ref(d8_k6_dd_1,8,6,"d").
exception_ref(d8_k6_dd_1,8,6,"dd").
fine_min(d8_k6_dd_1,3000000).
fine_max(d8_k6_dd_1,5000000).
original_vi_text(d8_k6_dd_1,"Không đi bên phải theo chiều đi của mình").

rule(d8_k6_dd_2).
rule_type(d8_k6_dd_2,primary_violation).
article(d8_k6_dd_2,8).
clause(d8_k6_dd_2,6).
point(d8_k6_dd_2,"dd").
subject(d8_k6_dd_2,specialized_vehicle).
action(d8_k6_dd_2,go_no_stop_phan_road_hoac_lane_road_quy_dinh_lane_cung_beam_hoac).
exception_ref(d8_k6_dd_2,8,6,"e").
exception_ref(d8_k6_dd_2,8,6,"d").
exception_ref(d8_k6_dd_2,8,6,"dd").
fine_min(d8_k6_dd_2,3000000).
fine_max(d8_k6_dd_2,5000000).
original_vi_text(d8_k6_dd_2,"đi không đúng phần đường hoặc làn đường quy định (làn cùng chiều hoặc làn ngược chiều)").

rule(d8_k6_dd_3).
rule_type(d8_k6_dd_3,primary_violation).
article(d8_k6_dd_3,8).
clause(d8_k6_dd_3,6).
point(d8_k6_dd_3,"dd").
subject(d8_k6_dd_3,specialized_vehicle).
action(d8_k6_dd_3,dieu_khien_vehicle_go_qua_belt_phan_cach_co_dinh_car_giua_hai_phan).
exception_ref(d8_k6_dd_3,8,6,"e").
exception_ref(d8_k6_dd_3,8,6,"d").
exception_ref(d8_k6_dd_3,8,6,"dd").
fine_min(d8_k6_dd_3,3000000).
fine_max(d8_k6_dd_3,5000000).
original_vi_text(d8_k6_dd_3,"điều khiển xe đi qua dải phân cách cố định ở giữa hai phần đường xe chạy").

rule(d8_k6_e_1).
rule_type(d8_k6_e_1,primary_violation).
article(d8_k6_e_1,8).
clause(d8_k6_e_1,6).
point(d8_k6_e_1,"e").
subject(d8_k6_e_1,specialized_vehicle).
action(d8_k6_e_1,no_tuan_thu_cac_quy_dinh_khi_enter_hoac_ra_road_highway_speed).
fine_min(d8_k6_e_1,3000000).
fine_max(d8_k6_e_1,5000000).
original_vi_text(d8_k6_e_1,"Không tuân thủ các quy định khi vào hoặc ra đường cao tốc").

rule(d8_k6_e_2).
rule_type(d8_k6_e_2,primary_violation).
article(d8_k6_e_2,8).
clause(d8_k6_e_2,6).
point(d8_k6_e_2,"e").
subject(d8_k6_e_2,specialized_vehicle).
action(d8_k6_e_2,dieu_khien_vehicle_chay_car_lane_stop_vehicle_emergency_emergency_hoac_phan_le_road).
fine_min(d8_k6_e_2,3000000).
fine_max(d8_k6_e_2,5000000).
original_vi_text(d8_k6_e_2,"điều khiển xe chạy ở làn dừng xe khẩn cấp hoặc phần lề đường của đường cao tốc").

rule(d8_k6_e_3).
rule_type(d8_k6_e_3,primary_violation).
article(d8_k6_e_3,8).
clause(d8_k6_e_3,6).
point(d8_k6_e_3,"e").
subject(d8_k6_e_3,specialized_vehicle).
action(d8_k6_e_3,no_tuan_thu_quy_dinh_ve_khoang_cach_safe_safety_doi_voi_vehicle_chay).
context(d8_k6_e_3,expressway).
fine_min(d8_k6_e_3,3000000).
fine_max(d8_k6_e_3,5000000).
original_vi_text(d8_k6_e_3,"không tuân thủ quy định về khoảng cách an toàn đối với xe chạy liền trước khi chạy trên đường cao tốc").

rule(d8_k6_g).
rule_type(d8_k6_g,primary_violation).
article(d8_k6_g,8).
clause(d8_k6_g,6).
point(d8_k6_g,"g").
subject(d8_k6_g,specialized_vehicle).
action(d8_k6_g,fail_to_yield_to_priority_vehicle).
fine_min(d8_k6_g,3000000).
fine_max(d8_k6_g,5000000).
original_vi_text(d8_k6_g,"Không nhường đường hoặc gây cản trở xe được quyền ưu tiên đang phát tín hiệu ưu tiên đi làm nhiệm vụ").

rule(d8_k6_h).
rule_type(d8_k6_h,primary_violation).
article(d8_k6_h,8).
clause(d8_k6_h,6).
point(d8_k6_h,"h").
subject(d8_k6_h,specialized_vehicle).
action(d8_k6_h,illegal_lane_change_or_no_signal).
context(d8_k6_h,expressway).
fine_min(d8_k6_h,3000000).
fine_max(d8_k6_h,5000000).
original_vi_text(d8_k6_h,"Chuyển làn đường không đúng nơi cho phép hoặc không có tín hiệu báo trước khi chạy trên đường cao tốc hoặc chuyển làn đường không đúng quy định \"mỗi lần chuyển làn đường chỉ được phép chuyển sang một làn đường liền kề\"").

rule(d8_k6_i).
rule_type(d8_k6_i,primary_violation).
article(d8_k6_i,8).
clause(d8_k6_i,6).
point(d8_k6_i,"i").
subject(d8_k6_i,specialized_vehicle).
action(d8_k6_i,no_giam_speed_level_hoac_stop_lai_va_yield_road_khi_dieu_khien_vehicle).
fine_min(d8_k6_i,3000000).
fine_max(d8_k6_i,5000000).
original_vi_text(d8_k6_i,"Không giảm tốc độ (hoặc dừng lại) và nhường đường khi điều khiển xe đi từ đường không ưu tiên ra đường ưu tiên, từ đường nhánh ra đường chính").

rule(d8_k7_a).
rule_type(d8_k7_a,primary_violation).
article(d8_k7_a,8).
clause(d8_k7_a,7).
point(d8_k7_a,"a").
subject(d8_k7_a,specialized_vehicle).
action(d8_k7_a,drive_with_alcohol_level_2).
fine_min(d8_k7_a,6000000).
fine_max(d8_k7_a,8000000).
original_vi_text(d8_k7_a,"Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn vượt quá 50 miligam đến 80 miligam/100 mililít máu hoặc vượt quá 0,25 miligam đến 0,4 miligam/1 lít khí thở").

rule(d8_k7_b).
rule_type(d8_k7_b,primary_violation).
article(d8_k7_b,8).
clause(d8_k7_b,7).
point(d8_k7_b,"b").
subject(d8_k7_b,specialized_vehicle).
action(d8_k7_b,disobey_traffic_controller).
fine_min(d8_k7_b,6000000).
fine_max(d8_k7_b,8000000).
original_vi_text(d8_k7_b,"Không chấp hành hiệu lệnh, hướng dẫn của người điều khiển giao thông hoặc người kiểm soát giao thông").

rule(d8_k7_c).
rule_type(d8_k7_c,primary_violation).
article(d8_k7_c,8).
clause(d8_k7_c,7).
point(d8_k7_c,"c").
subject(d8_k7_c,specialized_vehicle).
action(d8_k7_c,disobey_traffic_light).
fine_min(d8_k7_c,6000000).
fine_max(d8_k7_c,8000000).
original_vi_text(d8_k7_c,"Không chấp hành hiệu lệnh của đèn tín hiệu giao thông").

rule(d8_k7_d).
rule_type(d8_k7_d,primary_violation).
article(d8_k7_d,8).
clause(d8_k7_d,7).
point(d8_k7_d,"d").
subject(d8_k7_d,specialized_vehicle).
action(d8_k7_d,wrong_way_on_one_way_road).
context(d8_k7_d,no_entry_road).
exception_ref(d8_k7_d,8,9,"dd").
fine_min(d8_k7_d,6000000).
fine_max(d8_k7_d,8000000).
original_vi_text(d8_k7_d,"Đi ngược chiều của đường một chiều, đi ngược chiều trên đường có biển \"Cấm đi ngược chiều\"").

rule(d8_k8_a_1).
rule_type(d8_k8_a_1,primary_violation).
article(d8_k8_a_1,8).
clause(d8_k8_a_1,8).
point(d8_k8_a_1,"a").
subject(d8_k8_a_1,specialized_vehicle).
action(d8_k8_a_1,dieu_khien_vehicle_no_quan_close_giam_speed_level_hoac_stop_lai_de_signal).
exception_ref(d8_k8_a_1,8,8,"b").
exception_ref(d8_k8_a_1,8,8,"dd").
fine_min(d8_k8_a_1,14000000).
fine_max(d8_k8_a_1,16000000).
original_vi_text(d8_k8_a_1,"Điều khiển xe không quan sát, giảm tốc độ hoặc dừng lại để bảo đảm an toàn theo quy định mà gây tai nạn giao thông").

rule(d8_k8_a_2).
rule_type(d8_k8_a_2,primary_violation).
article(d8_k8_a_2,8).
clause(d8_k8_a_2,8).
point(d8_k8_a_2,"a").
subject(d8_k8_a_2,specialized_vehicle).
action(d8_k8_a_2,dieu_khien_vehicle_chay_qua_speed_level_quy_dinh_gay_tai_nan_traffic_traffic).
exception_ref(d8_k8_a_2,8,8,"b").
exception_ref(d8_k8_a_2,8,8,"dd").
fine_min(d8_k8_a_2,14000000).
fine_max(d8_k8_a_2,16000000).
original_vi_text(d8_k8_a_2,"điều khiển xe chạy quá tốc độ quy định gây tai nạn giao thông").

rule(d8_k8_a_3).
rule_type(d8_k8_a_3,primary_violation).
article(d8_k8_a_3,8).
clause(d8_k8_a_3,8).
point(d8_k8_a_3,"a").
subject(d8_k8_a_3,specialized_vehicle).
action(d8_k8_a_3,stop_vehicle_level_vehicle_u_turn_turn_vehicle_reverse_vehicle_tranh_vehicle_overtake_vehicle_change).
exception_ref(d8_k8_a_3,8,8,"b").
exception_ref(d8_k8_a_3,8,8,"dd").
fine_min(d8_k8_a_3,14000000).
fine_max(d8_k8_a_3,16000000).
original_vi_text(d8_k8_a_3,"dừng xe, đỗ xe, quay đầu xe, lùi xe, tránh xe, vượt xe, chuyển hướng, chuyển làn đường không đúng quy định gây tai nạn giao thông").

rule(d8_k8_a_4).
rule_type(d8_k8_a_4,primary_violation).
article(d8_k8_a_4,8).
clause(d8_k8_a_4,8).
point(d8_k8_a_4,"a").
subject(d8_k8_a_4,specialized_vehicle).
action(d8_k8_a_4,motor_cua_vehicle_de_cua_vehicle_motor_no_signal_dam_safe_safety_gay_tai).
exception_ref(d8_k8_a_4,8,8,"b").
exception_ref(d8_k8_a_4,8,8,"dd").
fine_min(d8_k8_a_4,14000000).
fine_max(d8_k8_a_4,16000000).
original_vi_text(d8_k8_a_4,"mở cửa xe, để cửa xe mở không bảo đảm an toàn gây tai nạn giao thông").

rule(d8_k8_a_5).
rule_type(d8_k8_a_5,primary_violation).
article(d8_k8_a_5,8).
clause(d8_k8_a_5,8).
point(d8_k8_a_5,"a").
subject(d8_k8_a_5,specialized_vehicle).
action(d8_k8_a_5,wrong_way_on_one_way_road).
context(d8_k8_a_5,no_entry_road).
exception_ref(d8_k8_a_5,8,8,"b").
exception_ref(d8_k8_a_5,8,8,"dd").
fine_min(d8_k8_a_5,14000000).
fine_max(d8_k8_a_5,16000000).
original_vi_text(d8_k8_a_5,"không đi đúng phần đường, làn đường, không giữ khoảng cách an toàn giữa hai xe theo quy định gây tai nạn giao thông hoặc đi vào đường có biển báo hiệu có nội dung cấm đi vào đối với loại phương tiện đang điều khiển, đi ngược chiều của đường một chiều, đi ngược chiều trên đường có biển \"Cấm đi ngược chiều\" gây tai nạn giao thông").

rule(d8_k8_b).
rule_type(d8_k8_b,primary_violation).
article(d8_k8_b,8).
clause(d8_k8_b,8).
point(d8_k8_b,"b").
subject(d8_k8_b,specialized_vehicle).
action(d8_k8_b,enter_expressway).
context(d8_k8_b,expressway).
fine_min(d8_k8_b,14000000).
fine_max(d8_k8_b,16000000).
original_vi_text(d8_k8_b,"Điều khiển xe máy chuyên dùng có tốc độ thiết kế nhỏ hơn tốc độ tối thiểu quy định đối với đường cao tốc đi vào đường cao tốc").

rule(d8_k8_c).
rule_type(d8_k8_c,primary_violation).
article(d8_k8_c,8).
clause(d8_k8_c,8).
point(d8_k8_c,"c").
subject(d8_k8_c,specialized_vehicle).
action(d8_k8_c,gay_tai_nan_traffic_traffic_no_stop_ngay_phuong_priority_no_giu_nguyen_hien).
fine_min(d8_k8_c,14000000).
fine_max(d8_k8_c,16000000).
original_vi_text(d8_k8_c,"Gây tai nạn giao thông không dừng ngay phương tiện, không giữ nguyên hiện trường, không trợ giúp người bị nạn, không ở lại hiện trường hoặc không đến trình báo ngay với cơ quan công an, Ủy ban nhân dân nơi gần nhất").

rule(d8_k8_d_1).
rule_type(d8_k8_d_1,primary_violation).
article(d8_k8_d_1,8).
clause(d8_k8_d_1,8).
point(d8_k8_d_1,"d").
subject(d8_k8_d_1,specialized_vehicle).
action(d8_k8_d_1,vi_pham_quy_dinh_tai_mot_trong_cac_diem_khoan_sau_cua_dieu_nay).
fine_min(d8_k8_d_1,14000000).
fine_max(d8_k8_d_1,16000000).
original_vi_text(d8_k8_d_1,"Vi phạm quy định tại một trong các điểm, khoản sau của Điều này mà gây tai nạn giao thông: điểm a, điểm b khoản 1").

rule(d8_k8_d_2).
rule_type(d8_k8_d_2,primary_violation).
article(d8_k8_d_2,8).
clause(d8_k8_d_2,8).
point(d8_k8_d_2,"d").
subject(d8_k8_d_2,specialized_vehicle).
action(d8_k8_d_2,diem_d_khoan_2).
fine_min(d8_k8_d_2,14000000).
fine_max(d8_k8_d_2,16000000).
original_vi_text(d8_k8_d_2,"điểm d khoản 2").

rule(d8_k8_d_3).
rule_type(d8_k8_d_3,primary_violation).
article(d8_k8_d_3,8).
clause(d8_k8_d_3,8).
point(d8_k8_d_3,"d").
subject(d8_k8_d_3,specialized_vehicle).
action(d8_k8_d_3,diem_b_diem_c_diem_d_diem_d_khoan_3).
fine_min(d8_k8_d_3,14000000).
fine_max(d8_k8_d_3,16000000).
original_vi_text(d8_k8_d_3,"điểm b, điểm c, điểm d, điểm đ khoản 3").

rule(d8_k8_d_4).
rule_type(d8_k8_d_4,primary_violation).
article(d8_k8_d_4,8).
clause(d8_k8_d_4,8).
point(d8_k8_d_4,"d").
subject(d8_k8_d_4,specialized_vehicle).
action(d8_k8_d_4,diem_b_khoan_4).
fine_min(d8_k8_d_4,14000000).
fine_max(d8_k8_d_4,16000000).
original_vi_text(d8_k8_d_4,"điểm b khoản 4").

rule(d8_k8_d_5).
rule_type(d8_k8_d_5,primary_violation).
article(d8_k8_d_5,8).
clause(d8_k8_d_5,8).
point(d8_k8_d_5,"d").
subject(d8_k8_d_5,specialized_vehicle).
action(d8_k8_d_5,diem_b_khoan_5).
fine_min(d8_k8_d_5,14000000).
fine_max(d8_k8_d_5,16000000).
original_vi_text(d8_k8_d_5,"điểm b khoản 5").

rule(d8_k8_d_6).
rule_type(d8_k8_d_6,primary_violation).
article(d8_k8_d_6,8).
clause(d8_k8_d_6,8).
point(d8_k8_d_6,"d").
subject(d8_k8_d_6,specialized_vehicle).
action(d8_k8_d_6,diem_e_diem_g_diem_i_khoan_6).
fine_min(d8_k8_d_6,14000000).
fine_max(d8_k8_d_6,16000000).
original_vi_text(d8_k8_d_6,"điểm e, điểm g, điểm i khoản 6").

rule(d8_k8_d_7).
rule_type(d8_k8_d_7,primary_violation).
article(d8_k8_d_7,8).
clause(d8_k8_d_7,8).
point(d8_k8_d_7,"d").
subject(d8_k8_d_7,specialized_vehicle).
action(d8_k8_d_7,diem_b_diem_c_khoan_7_dieu_nay).
fine_min(d8_k8_d_7,14000000).
fine_max(d8_k8_d_7,16000000).
original_vi_text(d8_k8_d_7,"điểm b, điểm c khoản 7 Điều này").

rule(d8_k9_a).
rule_type(d8_k9_a,primary_violation).
article(d8_k9_a,8).
clause(d8_k9_a,9).
point(d8_k9_a,"a").
subject(d8_k9_a,specialized_vehicle).
action(d8_k9_a,drive_with_alcohol_level_3).
fine_min(d8_k9_a,18000000).
fine_max(d8_k9_a,20000000).
original_vi_text(d8_k9_a,"Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn vượt quá 80 miligam/100 mililít máu hoặc vượt quá 0,4 miligam/1 lít khí thở").

rule(d8_k9_b).
rule_type(d8_k9_b,primary_violation).
article(d8_k9_b,8).
clause(d8_k9_b,9).
point(d8_k9_b,"b").
subject(d8_k9_b,specialized_vehicle).
action(d8_k9_b,refuse_alcohol_test).
fine_min(d8_k9_b,18000000).
fine_max(d8_k9_b,20000000).
original_vi_text(d8_k9_b,"Không chấp hành yêu cầu kiểm tra về nồng độ cồn của người thi hành công vụ").

rule(d8_k9_c).
rule_type(d8_k9_c,primary_violation).
article(d8_k9_c,8).
clause(d8_k9_c,9).
point(d8_k9_c,"c").
subject(d8_k9_c,specialized_vehicle).
action(d8_k9_c,drive_with_drugs).
fine_min(d8_k9_c,18000000).
fine_max(d8_k9_c,20000000).
original_vi_text(d8_k9_c,"Điều khiển xe trên đường mà trong cơ thể có chất ma túy hoặc chất kích thích khác mà pháp luật cấm sử dụng").

rule(d8_k9_d).
rule_type(d8_k9_d,primary_violation).
article(d8_k9_d,8).
clause(d8_k9_d,9).
point(d8_k9_d,"d").
subject(d8_k9_d,specialized_vehicle).
action(d8_k9_d,refuse_drug_test).
fine_min(d8_k9_d,18000000).
fine_max(d8_k9_d,20000000).
original_vi_text(d8_k9_d,"Không chấp hành yêu cầu kiểm tra về chất ma túy hoặc chất kích thích khác mà pháp luật cấm sử dụng của người thi hành công vụ").

rule(d8_k9_dd_1).
rule_type(d8_k9_dd_1,primary_violation).
article(d8_k9_dd_1,8).
clause(d8_k9_dd_1,9).
point(d8_k9_dd_1,"dd").
subject(d8_k9_dd_1,specialized_vehicle).
action(d8_k9_dd_1,reverse_on_expressway).
context(d8_k9_dd_1,expressway).
fine_min(d8_k9_dd_1,18000000).
fine_max(d8_k9_dd_1,20000000).
original_vi_text(d8_k9_dd_1,"Lùi xe trên đường cao tốc").

rule(d8_k9_dd_2).
rule_type(d8_k9_dd_2,primary_violation).
article(d8_k9_dd_2,8).
clause(d8_k9_dd_2,9).
point(d8_k9_dd_2,"dd").
subject(d8_k9_dd_2,specialized_vehicle).
action(d8_k9_dd_2,go_wrong_beam_tren_road_highway_speed).
context(d8_k9_dd_2,expressway).
fine_min(d8_k9_dd_2,18000000).
fine_max(d8_k9_dd_2,20000000).
original_vi_text(d8_k9_dd_2,"đi ngược chiều trên đường cao tốc").

rule(d8_k9_dd_3).
rule_type(d8_k9_dd_3,primary_violation).
article(d8_k9_dd_3,8).
clause(d8_k9_dd_3,9).
point(d8_k9_dd_3,"dd").
subject(d8_k9_dd_3,specialized_vehicle).
action(d8_k9_dd_3,uturn_on_expressway).
context(d8_k9_dd_3,expressway).
fine_min(d8_k9_dd_3,18000000).
fine_max(d8_k9_dd_3,20000000).
original_vi_text(d8_k9_dd_3,"quay đầu xe trên đường cao tốc").

rule(d8_k9_e).
rule_type(d8_k9_e,primary_violation).
article(d8_k9_e,8).
clause(d8_k9_e,9).
point(d8_k9_e,"e").
subject(d8_k9_e,specialized_vehicle).
action(d8_k9_e,vi_pham_quy_dinh_tai_diem_b_khoan_8_dieu_nay_drug_gay_tai).
fine_min(d8_k9_e,18000000).
fine_max(d8_k9_e,20000000).
original_vi_text(d8_k9_e,"Vi phạm quy định tại điểm b khoản 8 Điều này mà gây tai nạn giao thông").

rule(d9_k1_a).
rule_type(d9_k1_a,primary_violation).
article(d9_k1_a,9).
clause(d9_k1_a,1).
point(d9_k1_a,"a").
subject(d9_k1_a,bicycle_or_non_motor_vehicle).
action(d9_k1_a,no_go_ben_right_theo_beam_go_cua_minh_go_no_stop_phan_road).
fine_min(d9_k1_a,100000).
fine_max(d9_k1_a,200000).
original_vi_text(d9_k1_a,"Không đi bên phải theo chiều đi của mình, đi không đúng phần đường quy định").

rule(d9_k1_b_1).
rule_type(d9_k1_b_1,primary_violation).
article(d9_k1_b_1,9).
clause(d9_k1_b_1,1).
point(d9_k1_b_1,"b").
subject(d9_k1_b_1,bicycle_or_non_motor_vehicle).
action(d9_k1_b_1,stop_vehicle_dot_ngot).
fine_min(d9_k1_b_1,100000).
fine_max(d9_k1_b_1,200000).
original_vi_text(d9_k1_b_1,"Dừng xe đột ngột").

rule(d9_k1_b_2).
rule_type(d9_k1_b_2,primary_violation).
article(d9_k1_b_2,9).
clause(d9_k1_b_2,1).
point(d9_k1_b_2,"b").
subject(d9_k1_b_2,bicycle_or_non_motor_vehicle).
action(d9_k1_b_2,change_turn_no_signal_signal_truoc).
fine_min(d9_k1_b_2,100000).
fine_max(d9_k1_b_2,200000).
original_vi_text(d9_k1_b_2,"chuyển hướng không báo hiệu trước").

rule(d9_k1_c).
rule_type(d9_k1_c,primary_violation).
article(d9_k1_c,9).
clause(d9_k1_c,1).
point(d9_k1_c,"c").
subject(d9_k1_c,bicycle_or_non_motor_vehicle).
action(d9_k1_c,disobey_road_signs_or_markings).
exception_ref(d9_k1_c,9,2,"dd").
exception_ref(d9_k1_c,9,2,"c").
fine_min(d9_k1_c,100000).
fine_max(d9_k1_c,200000).
original_vi_text(d9_k1_c,"Không chấp hành hiệu lệnh hoặc chỉ dẫn của biển báo hiệu, vạch kẻ đường").

rule(d9_k1_d).
rule_type(d9_k1_d,primary_violation).
article(d9_k1_d,9).
clause(d9_k1_d,1).
point(d9_k1_d,"d").
subject(d9_k1_d,bicycle_or_non_motor_vehicle).
action(d9_k1_d,overtake_ben_right_trong_cac_truong_hop_no_duoc_permit).
fine_min(d9_k1_d,100000).
fine_max(d9_k1_d,200000).
original_vi_text(d9_k1_d,"Vượt bên phải trong các trường hợp không được phép").

rule(d9_k1_dd).
rule_type(d9_k1_dd,primary_violation).
article(d9_k1_dd,9).
clause(d9_k1_dd,1).
point(d9_k1_dd,"dd").
subject(d9_k1_dd,bicycle_or_non_motor_vehicle).
action(d9_k1_dd,stop_vehicle_level_vehicle_tren_phan_road_vehicle_chay_car_doan_road_ngoai_level).
context(d9_k1_dd,roadway).
fine_min(d9_k1_dd,100000).
fine_max(d9_k1_dd,200000).
original_vi_text(d9_k1_dd,"Dừng xe, đỗ xe trên phần đường xe chạy ở đoạn đường ngoài đô thị nơi có lề đường").

rule(d9_k1_e_1).
rule_type(d9_k1_e_1,primary_violation).
article(d9_k1_e_1,9).
clause(d9_k1_e_1,1).
point(d9_k1_e_1,"e").
subject(d9_k1_e_1,bicycle_or_non_motor_vehicle).
action(d9_k1_e_1,chay_trong_tunnel_road_bo_no_bat_light_hoac_no_co_vat_phat_sang).
context(d9_k1_e_1,tunnel).
fine_min(d9_k1_e_1,100000).
fine_max(d9_k1_e_1,200000).
original_vi_text(d9_k1_e_1,"Chạy trong hầm đường bộ không bật đèn hoặc không có vật phát sáng báo hiệu").

rule(d9_k1_e_2).
rule_type(d9_k1_e_2,primary_violation).
article(d9_k1_e_2,9).
clause(d9_k1_e_2,1).
point(d9_k1_e_2,"e").
subject(d9_k1_e_2,bicycle_or_non_motor_vehicle).
action(d9_k1_e_2,stop_or_park_improperly_in_tunnel).
context(d9_k1_e_2,tunnel).
fine_min(d9_k1_e_2,100000).
fine_max(d9_k1_e_2,200000).
original_vi_text(d9_k1_e_2,"dừng xe, đỗ xe trong hầm đường bộ không đúng nơi quy định").

rule(d9_k1_e_3).
rule_type(d9_k1_e_3,primary_violation).
article(d9_k1_e_3,9).
clause(d9_k1_e_3,1).
point(d9_k1_e_3,"e").
subject(d9_k1_e_3,bicycle_or_non_motor_vehicle).
action(d9_k1_e_3,uturn_in_tunnel).
context(d9_k1_e_3,tunnel).
fine_min(d9_k1_e_3,100000).
fine_max(d9_k1_e_3,200000).
original_vi_text(d9_k1_e_3,"quay đầu xe trong hầm đường bộ").

rule(d9_k1_g).
rule_type(d9_k1_g,primary_violation).
article(d9_k1_g,9).
clause(d9_k1_g,1).
point(d9_k1_g,"g").
subject(d9_k1_g,bicycle_or_non_motor_vehicle).
action(d9_k1_g,dieu_khien_vehicle_dap_vehicle_dap_machine_go_residential_hang_ngang_tu_03_vehicle).
fine_min(d9_k1_g,100000).
fine_max(d9_k1_g,200000).
original_vi_text(d9_k1_g,"Điều khiển xe đạp, xe đạp máy đi dàn hàng ngang từ 03 xe trở lên, xe thô sơ khác đi dàn hàng ngang từ 02 xe trở lên").

rule(d9_k1_h_1).
rule_type(d9_k1_h_1,primary_violation).
article(d9_k1_h_1,9).
clause(d9_k1_h_1,1).
point(d9_k1_h_1,"h").
subject(d9_k1_h_1,bicycle_or_non_motor_vehicle).
action(d9_k1_h_1,nguoi_dieu_khien_vehicle_dap_vehicle_dap_machine_use_stop_car_du_stop_tay).
fine_min(d9_k1_h_1,100000).
fine_max(d9_k1_h_1,200000).
original_vi_text(d9_k1_h_1,"Người điều khiển xe đạp, xe đạp máy sử dụng ô (dù), dùng tay cầm và sử dụng điện thoại hoặc các thiết bị điện tử khác").

rule(d9_k1_h_2).
rule_type(d9_k1_h_2,primary_violation).
article(d9_k1_h_2,9).
clause(d9_k1_h_2,1).
point(d9_k1_h_2,"h").
subject(d9_k1_h_2,bicycle_or_non_motor_vehicle).
action(d9_k1_h_2,cho_nguoi_ngoi_tren_vehicle_dap_vehicle_dap_machine_use_stop_car_du).
fine_min(d9_k1_h_2,100000).
fine_max(d9_k1_h_2,200000).
original_vi_text(d9_k1_h_2,"chở người ngồi trên xe đạp, xe đạp máy sử dụng ô (dù)").

rule(d9_k1_i).
rule_type(d9_k1_i,primary_violation).
article(d9_k1_i,9).
clause(d9_k1_i,1).
point(d9_k1_i,"i").
subject(d9_k1_i,bicycle_or_non_motor_vehicle).
action(d9_k1_i,dieu_khien_vehicle_tho_so_trong_thoi_gian_tu_18_gio_ngay_hom_truoc).
context(d9_k1_i,time_18_to_06).
fine_min(d9_k1_i,100000).
fine_max(d9_k1_i,200000).
original_vi_text(d9_k1_i,"Điều khiển xe thô sơ trong thời gian từ 18 giờ ngày hôm trước đến 06 giờ ngày hôm sau không sử dụng đèn hoặc không có báo hiệu ở phía trước và phía sau xe").

rule(d9_k1_k_1).
rule_type(d9_k1_k_1,primary_violation).
article(d9_k1_k_1,9).
clause(d9_k1_k_1,1).
point(d9_k1_k_1,"k").
subject(d9_k1_k_1,bicycle_or_non_motor_vehicle).
action(d9_k1_k_1,de_vehicle_car_long_road_sidewalk_sidewalk_left_permit).
fine_min(d9_k1_k_1,100000).
fine_max(d9_k1_k_1,200000).
original_vi_text(d9_k1_k_1,"Để xe ở lòng đường, vỉa hè trái phép").

rule(d9_k1_k_2).
rule_type(d9_k1_k_2,primary_violation).
article(d9_k1_k_2,9).
clause(d9_k1_k_2,1).
point(d9_k1_k_2,"k").
subject(d9_k1_k_2,bicycle_or_non_motor_vehicle).
action(d9_k1_k_2,level_vehicle_car_long_road_gay_can_tro_traffic_traffic_level_vehicle_tren_bridge).
context(d9_k1_k_2,bridge).
fine_min(d9_k1_k_2,100000).
fine_max(d9_k1_k_2,200000).
original_vi_text(d9_k1_k_2,"đỗ xe ở lòng đường gây cản trở giao thông, đỗ xe trên cầu gây cản trở giao thông").

rule(d9_k1_l).
rule_type(d9_k1_l,primary_violation).
article(d9_k1_l,9).
clause(d9_k1_l,1).
point(d9_k1_l,"l").
subject(d9_k1_l,bicycle_or_non_motor_vehicle).
action(d9_k1_l,no_tuan_thu_cac_quy_dinh_ve_stop_vehicle_level_vehicle_tai_noi_road).
context(d9_k1_l,intersection).
context(d9_k1_l,railway_crossing).
fine_min(d9_k1_l,100000).
fine_max(d9_k1_l,200000).
original_vi_text(d9_k1_l,"Không tuân thủ các quy định về dừng xe, đỗ xe tại nơi đường bộ giao nhau cùng mức với đường sắt").

rule(d9_k1_m).
rule_type(d9_k1_m,primary_violation).
article(d9_k1_m,9).
clause(d9_k1_m,1).
point(d9_k1_m,"m").
subject(d9_k1_m,bicycle_or_non_motor_vehicle).
action(d9_k1_m,stop_vehicle_belt_lam_u_turn_hang_luu_dong_tren_road_gay_can_tro_traffic).
fine_min(d9_k1_m,100000).
fine_max(d9_k1_m,200000).
original_vi_text(d9_k1_m,"Dùng xe đẩy làm quầy hàng lưu động trên đường gây cản trở giao thông").

rule(d9_k1_n).
rule_type(d9_k1_n,primary_violation).
article(d9_k1_n,9).
clause(d9_k1_n,1).
point(d9_k1_n,"n").
subject(d9_k1_n,bicycle_or_non_motor_vehicle).
action(d9_k1_n,no_giam_speed_level_hoac_stop_lai_va_yield_road_khi_dieu_khien_vehicle).
fine_min(d9_k1_n,100000).
fine_max(d9_k1_n,200000).
original_vi_text(d9_k1_n,"Không giảm tốc độ (hoặc dừng lại) và nhường đường khi điều khiển xe đi từ đường không ưu tiên ra đường ưu tiên, từ đường nhánh ra đường chính").

rule(d9_k1_o).
rule_type(d9_k1_o,primary_violation).
article(d9_k1_o,9).
clause(d9_k1_o,1).
point(d9_k1_o,"o").
subject(d9_k1_o,bicycle_or_non_motor_vehicle).
action(d9_k1_o,vehicle_dap_vehicle_dap_machine_vehicle_xich_lo_cho_qua_so_nguoi_quy_dinh).
fine_min(d9_k1_o,100000).
fine_max(d9_k1_o,200000).
original_vi_text(d9_k1_o,"Xe đạp, xe đạp máy, xe xích lô chở quá số người quy định").

rule(d9_k1_p).
rule_type(d9_k1_p,primary_violation).
article(d9_k1_p,9).
clause(d9_k1_p,1).
point(d9_k1_p,"p").
subject(d9_k1_p,bicycle_or_non_motor_vehicle).
action(d9_k1_p,drive_with_alcohol_level_1).
fine_min(d9_k1_p,100000).
fine_max(d9_k1_p,200000).
original_vi_text(d9_k1_p,"Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn nhưng chưa vượt quá 50 miligam/100 mililít máu hoặc chưa vượt quá 0,25 miligam/1 lít khí thở").

rule(d9_k2_a_1).
rule_type(d9_k2_a_1,primary_violation).
article(d9_k2_a_1,9).
clause(d9_k2_a_1,2).
point(d9_k2_a_1,"a").
subject(d9_k2_a_1,bicycle_or_non_motor_vehicle).
action(d9_k2_a_1,dieu_khien_vehicle_dap_vehicle_dap_machine_buong_ca_hai_tay).
fine_min(d9_k2_a_1,150000).
fine_max(d9_k2_a_1,250000).
original_vi_text(d9_k2_a_1,"Điều khiển xe đạp, xe đạp máy buông cả hai tay").

rule(d9_k2_a_2).
rule_type(d9_k2_a_2,primary_violation).
article(d9_k2_a_2,9).
clause(d9_k2_a_2,2).
point(d9_k2_a_2,"a").
subject(d9_k2_a_2,bicycle_or_non_motor_vehicle).
action(d9_k2_a_2,change_turn_dot_ngot_truoc_turn_vehicle_co_gioi_dang_chay).
fine_min(d9_k2_a_2,150000).
fine_max(d9_k2_a_2,250000).
original_vi_text(d9_k2_a_2,"chuyển hướng đột ngột trước đầu xe cơ giới đang chạy").

rule(d9_k2_a_3).
rule_type(d9_k2_a_3,primary_violation).
article(d9_k2_a_3,9).
clause(d9_k2_a_3,2).
point(d9_k2_a_3,"a").
subject(d9_k2_a_3,bicycle_or_non_motor_vehicle).
action(d9_k2_a_3,stop_chan_dieu_khien_vehicle_dap_vehicle_dap_machine).
fine_min(d9_k2_a_3,150000).
fine_max(d9_k2_a_3,250000).
original_vi_text(d9_k2_a_3,"dùng chân điều khiển xe đạp, xe đạp máy").

rule(d9_k2_b).
rule_type(d9_k2_b,primary_violation).
article(d9_k2_b,9).
clause(d9_k2_b,2).
point(d9_k2_b,"b").
subject(d9_k2_b,bicycle_or_non_motor_vehicle).
action(d9_k2_b,no_obey_obey_signal_order_instruction_residential_cua_nguoi_dieu_khien_traffic_traffic_hoac).
fine_min(d9_k2_b,150000).
fine_max(d9_k2_b,250000).
original_vi_text(d9_k2_b,"Không chấp hành hiệu lệnh, chỉ dẫn của người điều khiển giao thông hoặc người kiểm soát giao thông").

rule(d9_k2_c_1).
rule_type(d9_k2_c_1,primary_violation).
article(d9_k2_c_1,9).
clause(d9_k2_c_1,2).
point(d9_k2_c_1,"c").
subject(d9_k2_c_1,bicycle_or_non_motor_vehicle).
action(d9_k2_c_1,nguoi_dang_dieu_khien_vehicle_hoac_cho_nguoi_ngoi_tren_vehicle_bam_keo_belt).
fine_min(d9_k2_c_1,150000).
fine_max(d9_k2_c_1,250000).
original_vi_text(d9_k2_c_1,"Người đang điều khiển xe hoặc chở người ngồi trên xe bám, kéo, đẩy xe khác, vật khác, mang vác vật cồng kềnh").

rule(d9_k2_c_2).
rule_type(d9_k2_c_2,primary_violation).
article(d9_k2_c_2,9).
clause(d9_k2_c_2,2).
point(d9_k2_c_2,"c").
subject(d9_k2_c_2,bicycle_or_non_motor_vehicle).
action(d9_k2_c_2,dieu_khien_vehicle_keo_theo_vehicle_khac_vat_khac).
fine_min(d9_k2_c_2,150000).
fine_max(d9_k2_c_2,250000).
original_vi_text(d9_k2_c_2,"điều khiển xe kéo theo xe khác, vật khác").

rule(d9_k2_d).
rule_type(d9_k2_d,primary_violation).
article(d9_k2_d,9).
clause(d9_k2_d,2).
point(d9_k2_d,"d").
subject(d9_k2_d,bicycle_or_non_motor_vehicle).
action(d9_k2_d,no_yield_road_cho_vehicle_xin_overtake_khi_co_du_dieu_kien_safe_safety).
fine_min(d9_k2_d,150000).
fine_max(d9_k2_d,250000).
original_vi_text(d9_k2_d,"Không nhường đường cho xe xin vượt khi có đủ điều kiện an toàn hoặc gây cản trở đối với xe cơ giới xin vượt, gây cản trở xe ưu tiên").

rule(d9_k2_dd).
rule_type(d9_k2_dd,primary_violation).
article(d9_k2_dd,9).
clause(d9_k2_dd,2).
point(d9_k2_dd,"dd").
subject(d9_k2_dd,bicycle_or_non_motor_vehicle).
action(d9_k2_dd,disobey_traffic_light).
fine_min(d9_k2_dd,150000).
fine_max(d9_k2_dd,250000).
original_vi_text(d9_k2_dd,"Không chấp hành hiệu lệnh của đèn tín hiệu giao thông").

rule(d9_k3_a_1).
rule_type(d9_k3_a_1,primary_violation).
article(d9_k3_a_1,9).
clause(d9_k3_a_1,3).
point(d9_k3_a_1,"a").
subject(d9_k3_a_1,bicycle_or_non_motor_vehicle).
action(d9_k3_a_1,dieu_khien_vehicle_lang_lach_danh_vong).
fine_min(d9_k3_a_1,300000).
fine_max(d9_k3_a_1,400000).
original_vi_text(d9_k3_a_1,"Điều khiển xe lạng lách, đánh võng").

rule(d9_k3_a_2).
rule_type(d9_k3_a_2,primary_violation).
article(d9_k3_a_2,9).
clause(d9_k3_a_2,3).
point(d9_k3_a_2,"a").
subject(d9_k3_a_2,bicycle_or_non_motor_vehicle).
action(d9_k3_a_2,duoi_nhau_tren_road).
fine_min(d9_k3_a_2,300000).
fine_max(d9_k3_a_2,400000).
original_vi_text(d9_k3_a_2,"đuổi nhau trên đường").

rule(d9_k3_b_1).
rule_type(d9_k3_b_1,primary_violation).
article(d9_k3_b_1,9).
clause(d9_k3_b_1,3).
point(d9_k3_b_1,"b").
subject(d9_k3_b_1,bicycle_or_non_motor_vehicle).
action(d9_k3_b_1,go_vehicle_bang_mot_banh_doi_voi_vehicle_dap_vehicle_dap_machine).
fine_min(d9_k3_b_1,300000).
fine_max(d9_k3_b_1,400000).
original_vi_text(d9_k3_b_1,"Đi xe bằng một bánh đối với xe đạp, xe đạp máy").

rule(d9_k3_b_2).
rule_type(d9_k3_b_2,primary_violation).
article(d9_k3_b_2,9).
clause(d9_k3_b_2,3).
point(d9_k3_b_2,"b").
subject(d9_k3_b_2,bicycle_or_non_motor_vehicle).
action(d9_k3_b_2,go_vehicle_bang_hai_banh_doi_voi_vehicle_xich_lo).
fine_min(d9_k3_b_2,300000).
fine_max(d9_k3_b_2,400000).
original_vi_text(d9_k3_b_2,"đi xe bằng hai bánh đối với xe xích lô").

rule(d9_k3_c_1).
rule_type(d9_k3_c_1,primary_violation).
article(d9_k3_c_1,9).
clause(d9_k3_c_1,3).
point(d9_k3_c_1,"c").
subject(d9_k3_c_1,bicycle_or_non_motor_vehicle).
action(d9_k3_c_1,go_enter_khu_vuc_prohibited_road_co_sign_signal_signal_noi_stop_prohibited_go).
fine_min(d9_k3_c_1,300000).
fine_max(d9_k3_c_1,400000).
original_vi_text(d9_k3_c_1,"Đi vào khu vực cấm, đường có biển báo hiệu nội dung cấm đi vào đối với loại phương tiện đang điều khiển").

rule(d9_k3_c_2).
rule_type(d9_k3_c_2,primary_violation).
article(d9_k3_c_2,9).
clause(d9_k3_c_2,3).
point(d9_k3_c_2,"c").
subject(d9_k3_c_2,bicycle_or_non_motor_vehicle).
action(d9_k3_c_2,go_wrong_beam_road_cua_road_mot_beam_road_co_sign_prohibited_go_wrong).
fine_min(d9_k3_c_2,300000).
fine_max(d9_k3_c_2,400000).
original_vi_text(d9_k3_c_2,"đi ngược chiều đường của đường một chiều, đường có biển \"Cấm đi ngược chiều\"").

rule(d9_k3_d).
rule_type(d9_k3_d,primary_violation).
article(d9_k3_d,9).
clause(d9_k3_d,3).
point(d9_k3_d,"d").
subject(d9_k3_d,bicycle_or_non_motor_vehicle).
action(d9_k3_d,drive_with_alcohol_level_2).
fine_min(d9_k3_d,300000).
fine_max(d9_k3_d,400000).
original_vi_text(d9_k3_d,"Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn vượt quá 50 miligam đến 80 miligam/100 mililít máu hoặc vượt quá 0,25 miligam đến 0,4 miligam/1 lít khí thở").

rule(d9_k4_a).
rule_type(d9_k4_a,primary_violation).
article(d9_k4_a,9).
clause(d9_k4_a,4).
point(d9_k4_a,"a").
subject(d9_k4_a,bicycle_or_non_motor_vehicle).
action(d9_k4_a,gay_tai_nan_traffic_traffic_no_stop_ngay_phuong_priority_no_giu_nguyen_hien).
fine_min(d9_k4_a,400000).
fine_max(d9_k4_a,600000).
original_vi_text(d9_k4_a,"Gây tai nạn giao thông không dừng ngay phương tiện, không giữ nguyên hiện trường, không trợ giúp người bị nạn, không ở lại hiện trường hoặc không đến trình báo ngay với cơ quan công an, Ủy ban nhân dân nơi gần nhất").

rule(d9_k4_b).
rule_type(d9_k4_b,primary_violation).
article(d9_k4_b,9).
clause(d9_k4_b,4).
point(d9_k4_b,"b").
subject(d9_k4_b,bicycle_or_non_motor_vehicle).
action(d9_k4_b,drive_with_alcohol_level_3).
fine_min(d9_k4_b,400000).
fine_max(d9_k4_b,600000).
original_vi_text(d9_k4_b,"Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn vượt quá 80 miligam/100 mililít máu hoặc vượt quá 0,4 miligam/1 lít khí thở").

rule(d9_k4_c).
rule_type(d9_k4_c,primary_violation).
article(d9_k4_c,9).
clause(d9_k4_c,4).
point(d9_k4_c,"c").
subject(d9_k4_c,bicycle_or_non_motor_vehicle).
action(d9_k4_c,refuse_alcohol_test).
fine_min(d9_k4_c,400000).
fine_max(d9_k4_c,600000).
original_vi_text(d9_k4_c,"Không chấp hành yêu cầu kiểm tra về nồng độ cồn của người thi hành công vụ").

rule(d9_k4_d).
rule_type(d9_k4_d,primary_violation).
article(d9_k4_d,9).
clause(d9_k4_d,4).
point(d9_k4_d,"d").
subject(d9_k4_d,bicycle_or_non_motor_vehicle).
action(d9_k4_d,nguoi_dieu_khien_vehicle_dap_machine_no_doi_mu_signal_hiem_cho_nguoi_go).
fine_min(d9_k4_d,400000).
fine_max(d9_k4_d,600000).
original_vi_text(d9_k4_d,"Người điều khiển xe đạp máy không đội \"mũ bảo hiểm cho người đi mô tô, xe máy\" hoặc đội \"mũ bảo hiểm cho người đi mô tô, xe máy\" không cài quai đúng quy cách khi tham gia giao thông trên đường bộ").

rule(d9_k4_dd).
rule_type(d9_k4_dd,primary_violation).
article(d9_k4_dd,9).
clause(d9_k4_dd,4).
point(d9_k4_dd,"dd").
subject(d9_k4_dd,bicycle_or_non_motor_vehicle).
action(d9_k4_dd,cho_nguoi_ngoi_tren_vehicle_dap_machine_no_doi_mu_signal_hiem_cho_nguoi).
fine_min(d9_k4_dd,400000).
fine_max(d9_k4_dd,600000).
original_vi_text(d9_k4_dd,"Chở người ngồi trên xe đạp máy không đội \"mũ bảo hiểm cho người đi mô tô, xe máy\" hoặc đội \"mũ bảo hiểm cho người đi mô tô, xe máy\" không cài quai đúng quy cách").

rule(d9_k5).
rule_type(d9_k5,primary_violation).
article(d9_k5,9).
clause(d9_k5,5).
subject(d9_k5,bicycle_or_non_motor_vehicle).
action(d9_k5,enter_expressway).
context(d9_k5,expressway).
fine_min(d9_k5,800000).
fine_max(d9_k5,1200000).
original_vi_text(d9_k5,"5. Phạt tiền từ 800.000 đồng đến 1.200.000 đồng đối với người điều khiển xe đi vào đường cao tốc").

rule(d10_k1_a_1).
rule_type(d10_k1_a_1,primary_violation).
article(d10_k1_a_1,10).
clause(d10_k1_a_1,1).
point(d10_k1_a_1,"a").
subject(d10_k1_a_1,pedestrian).
action(d10_k1_a_1,no_go_stop_phan_road_quy_dinh).
fine_min(d10_k1_a_1,150000).
fine_max(d10_k1_a_1,250000).
original_vi_text(d10_k1_a_1,"Không đi đúng phần đường quy định").

rule(d10_k1_a_2).
rule_type(d10_k1_a_2,primary_violation).
article(d10_k1_a_2,10).
clause(d10_k1_a_2,1).
point(d10_k1_a_2,"a").
subject(d10_k1_a_2,pedestrian).
action(d10_k1_a_2,overtake_qua_belt_phan_cach).
fine_min(d10_k1_a_2,150000).
fine_max(d10_k1_a_2,250000).
original_vi_text(d10_k1_a_2,"vượt qua dải phân cách").

rule(d10_k1_a_3).
rule_type(d10_k1_a_3,primary_violation).
article(d10_k1_a_3,10).
clause(d10_k1_a_3,1).
point(d10_k1_a_3,"a").
subject(d10_k1_a_3,pedestrian).
action(d10_k1_a_3,go_qua_road_no_stop_noi_quy_dinh).
fine_min(d10_k1_a_3,150000).
fine_max(d10_k1_a_3,250000).
original_vi_text(d10_k1_a_3,"đi qua đường không đúng nơi quy định").

rule(d10_k1_a_4).
rule_type(d10_k1_a_4,primary_violation).
article(d10_k1_a_4,10).
clause(d10_k1_a_4,1).
point(d10_k1_a_4,"a").
subject(d10_k1_a_4,pedestrian).
action(d10_k1_a_4,go_qua_road_no_co_tin_signal_bang_tay_theo_quy_dinh).
fine_min(d10_k1_a_4,150000).
fine_max(d10_k1_a_4,250000).
original_vi_text(d10_k1_a_4,"đi qua đường không có tín hiệu bằng tay theo quy định").

rule(d10_k1_b).
rule_type(d10_k1_b,primary_violation).
article(d10_k1_b,10).
clause(d10_k1_b,1).
point(d10_k1_b,"b").
subject(d10_k1_b,pedestrian).
action(d10_k1_b,disobey_signals_signs_or_markings).
exception_ref(d10_k1_b,10,2,"a").
fine_min(d10_k1_b,150000).
fine_max(d10_k1_b,250000).
original_vi_text(d10_k1_b,"Không chấp hành hiệu lệnh hoặc chỉ dẫn của đèn tín hiệu, biển báo hiệu, vạch kẻ đường").

rule(d10_k1_c).
rule_type(d10_k1_c,primary_violation).
article(d10_k1_c,10).
clause(d10_k1_c,1).
point(d10_k1_c,"c").
subject(d10_k1_c,pedestrian).
action(d10_k1_c,disobey_traffic_controller).
fine_min(d10_k1_c,150000).
fine_max(d10_k1_c,250000).
original_vi_text(d10_k1_c,"Không chấp hành hiệu lệnh, hướng dẫn của người điều khiển giao thông hoặc người kiểm soát giao thông").

rule(d10_k2_a).
rule_type(d10_k2_a,primary_violation).
article(d10_k2_a,10).
clause(d10_k2_a,2).
point(d10_k2_a,"a").
subject(d10_k2_a,pedestrian).
action(d10_k2_a,enter_expressway).
context(d10_k2_a,expressway).
fine_min(d10_k2_a,400000).
fine_max(d10_k2_a,600000).
original_vi_text(d10_k2_a,"Đi vào đường cao tốc").

rule(d10_k2_b).
rule_type(d10_k2_b,primary_violation).
article(d10_k2_b,10).
clause(d10_k2_b,2).
point(d10_k2_b,"b").
subject(d10_k2_b,pedestrian).
action(d10_k2_b,mang_vac_vat_cong_kenh_gay_can_tro_traffic_traffic).
fine_min(d10_k2_b,400000).
fine_max(d10_k2_b,600000).
original_vi_text(d10_k2_b,"Mang, vác vật cồng kềnh gây cản trở giao thông").

rule(d10_k2_c).
rule_type(d10_k2_c,primary_violation).
article(d10_k2_c,10).
clause(d10_k2_c,2).
point(d10_k2_c,"c").
subject(d10_k2_c,pedestrian).
action(d10_k2_c,du_bam_enter_phuong_priority_traffic_traffic_dang_chay).
fine_min(d10_k2_c,400000).
fine_max(d10_k2_c,600000).
original_vi_text(d10_k2_c,"Đu, bám vào phương tiện giao thông đang chạy").

rule(d11_k1_a).
rule_type(d11_k1_a,primary_violation).
article(d11_k1_a,11).
clause(d11_k1_a,1).
point(d11_k1_a,"a").
subject(d11_k1_a,animal_handler_or_animal_drawn_vehicle).
action(d11_k1_a,no_yield_road_theo_quy_dinh_no_signal_signal_bang_tay_khi_change_turn).
fine_min(d11_k1_a,150000).
fine_max(d11_k1_a,250000).
original_vi_text(d11_k1_a,"Không nhường đường theo quy định, không báo hiệu bằng tay khi chuyển hướng").

rule(d11_k1_b).
rule_type(d11_k1_b,primary_violation).
article(d11_k1_b,11).
clause(d11_k1_b,1).
point(d11_k1_b,"b").
subject(d11_k1_b,animal_handler_or_animal_drawn_vehicle).
action(d11_k1_b,disobey_signals_signs_or_markings).
exception_ref(d11_k1_b,11,3,"all").
fine_min(d11_k1_b,150000).
fine_max(d11_k1_b,250000).
original_vi_text(d11_k1_b,"Không chấp hành hiệu lệnh hoặc chỉ dẫn của đèn tín hiệu, biển báo hiệu, vạch kẻ đường").

rule(d11_k1_c).
rule_type(d11_k1_c,primary_violation).
article(d11_k1_c,11).
clause(d11_k1_c,1).
point(d11_k1_c,"c").
subject(d11_k1_c,animal_handler_or_animal_drawn_vehicle).
action(d11_k1_c,no_du_stop_residential_stop_chat_thai_cua_vat_nuoi_hoac_no_don_sach).
fine_min(d11_k1_c,150000).
fine_max(d11_k1_c,250000).
original_vi_text(d11_k1_c,"Không đủ dụng cụ đựng chất thải của vật nuôi hoặc không dọn sạch chất thải của vật nuôi thải ra đường, vỉa hè").

rule(d11_k1_d).
rule_type(d11_k1_d,primary_violation).
article(d11_k1_d,11).
clause(d11_k1_d,1).
point(d11_k1_d,"d").
subject(d11_k1_d,animal_handler_or_animal_drawn_vehicle).
action(d11_k1_d,de_vat_nuoi_go_tren_road_bo_no_signal_dam_safe_safety_cho_nguoi).
fine_min(d11_k1_d,150000).
fine_max(d11_k1_d,250000).
original_vi_text(d11_k1_d,"Để vật nuôi đi trên đường bộ không bảo đảm an toàn cho người, phương tiện đang tham gia giao thông").

rule(d11_k1_dd).
rule_type(d11_k1_dd,primary_violation).
article(d11_k1_dd,11).
clause(d11_k1_dd,1).
point(d11_k1_dd,"dd").
subject(d11_k1_dd,animal_handler_or_animal_drawn_vehicle).
action(d11_k1_dd,go_residential_hang_ngang_tu_02_vehicle_tro_len).
fine_min(d11_k1_dd,150000).
fine_max(d11_k1_dd,250000).
original_vi_text(d11_k1_dd,"Đi dàn hàng ngang từ 02 xe trở lên").

rule(d11_k1_e).
rule_type(d11_k1_e,primary_violation).
article(d11_k1_e,11).
clause(d11_k1_e,1).
point(d11_k1_e,"e").
subject(d11_k1_e,animal_handler_or_animal_drawn_vehicle).
action(d11_k1_e,de_vat_nuoi_keo_vehicle_drug_no_co_nguoi_dieu_khien).
fine_min(d11_k1_e,150000).
fine_max(d11_k1_e,250000).
original_vi_text(d11_k1_e,"Để vật nuôi kéo xe mà không có người điều khiển").

rule(d11_k1_g).
rule_type(d11_k1_g,primary_violation).
article(d11_k1_g,11).
clause(d11_k1_g,1).
point(d11_k1_g,"g").
subject(d11_k1_g,animal_handler_or_animal_drawn_vehicle).
action(d11_k1_g,dieu_khien_vehicle_no_co_signal_signal_theo_quy_dinh).
fine_min(d11_k1_g,150000).
fine_max(d11_k1_g,250000).
original_vi_text(d11_k1_g,"Điều khiển xe không có báo hiệu theo quy định").

rule(d11_k2_a).
rule_type(d11_k2_a,primary_violation).
article(d11_k2_a,11).
clause(d11_k2_a,2).
point(d11_k2_a,"a").
subject(d11_k2_a,animal_handler_or_animal_drawn_vehicle).
action(d11_k2_a,disobey_traffic_controller).
fine_min(d11_k2_a,400000).
fine_max(d11_k2_a,600000).
original_vi_text(d11_k2_a,"Không chấp hành hiệu lệnh, hướng dẫn của người điều khiển giao thông hoặc người kiểm soát giao thông").

rule(d11_k2_b).
rule_type(d11_k2_b,primary_violation).
article(d11_k2_b,11).
clause(d11_k2_b,2).
point(d11_k2_b,"b").
subject(d11_k2_b,animal_handler_or_animal_drawn_vehicle).
action(d11_k2_b,residential_dat_vat_nuoi_chay_theo_khi_dang_dieu_khien_hoac_ngoi_tren_phuong).
fine_min(d11_k2_b,400000).
fine_max(d11_k2_b,600000).
original_vi_text(d11_k2_b,"Dẫn dắt vật nuôi chạy theo khi đang điều khiển hoặc ngồi trên phương tiện giao thông đường bộ").

rule(d11_k2_c).
rule_type(d11_k2_c,primary_violation).
article(d11_k2_c,11).
clause(d11_k2_c,2).
point(d11_k2_c,"c").
subject(d11_k2_c,animal_handler_or_animal_drawn_vehicle).
action(d11_k2_c,dieu_khien_residential_dat_vat_nuoi_go_no_stop_phan_road_quy_dinh_go).
fine_min(d11_k2_c,400000).
fine_max(d11_k2_c,600000).
original_vi_text(d11_k2_c,"Điều khiển, dẫn dắt vật nuôi đi không đúng phần đường quy định, đi vào đường cấm, khu vực cấm, đi vào phần đường của xe cơ giới").

rule(d11_k3).
rule_type(d11_k3,primary_violation).
article(d11_k3,11).
clause(d11_k3,3).
subject(d11_k3,animal_handler_or_animal_drawn_vehicle).
action(d11_k3,enter_expressway).
context(d11_k3,expressway).
fine_min(d11_k3,1000000).
fine_max(d11_k3,2000000).
original_vi_text(d11_k3,"3. Phạt tiền từ 1.000.000 đồng đến 2.000.000 đồng đối với người điều khiển, dẫn dắt vật nuôi, điều khiển xe vật nuôi kéo đi vào đường cao tốc").

rule(d12_k1).
rule_type(d12_k1,primary_violation).
article(d12_k1,12).
clause(d12_k1,1).
subject(d12_k1,bicycle_passenger).
action(d12_k1,1_phat_priority_tu_100_000_dong_light_200_000_dong_doi_voi_nguoi).
fine_min(d12_k1,100000).
fine_max(d12_k1,200000).
original_vi_text(d12_k1,"1. Phạt tiền từ 100.000 đồng đến 200.000 đồng đối với người được chở trên xe đạp, xe đạp máy sử dụng ô (dù)").

rule(d12_k2_a).
rule_type(d12_k2_a,primary_violation).
article(d12_k2_a,12).
clause(d12_k2_a,2).
point(d12_k2_a,"a").
subject(d12_k2_a,individual).
action(d12_k2_a,tap_trung_dong_nguoi_left_permit_nam_ngoi_tren_road_bo_gay_can_tro).
fine_min(d12_k2_a,200000).
fine_max(d12_k2_a,250000).
original_vi_text(d12_k2_a,"Tập trung đông người trái phép, nằm, ngồi trên đường bộ gây cản trở giao thông").

rule(d12_k2_b_1).
rule_type(d12_k2_b_1,primary_violation).
article(d12_k2_b_1,12).
clause(d12_k2_b_1,2).
point(d12_k2_b_1,"b").
subject(d12_k2_b_1,individual).
action(d12_k2_b_1,da_bong_da_bridge_choi_bridge_long_hoac_cac_hoat_dong_the_thao_khac).
fine_min(d12_k2_b_1,200000).
fine_max(d12_k2_b_1,250000).
original_vi_text(d12_k2_b_1,"Đá bóng, đá cầu, chơi cầu lông hoặc các hoạt động thể thao khác trái phép trên đường bộ").

rule(d12_k2_b_2).
rule_type(d12_k2_b_2,primary_violation).
article(d12_k2_b_2,12).
clause(d12_k2_b_2,2).
point(d12_k2_b_2,"b").
subject(d12_k2_b_2,individual).
action(d12_k2_b_2,use_stop_ban_truot_pa_tanh_cac_thiet_bi_tuong_tu_tren_phan_road).
context(d12_k2_b_2,roadway).
fine_min(d12_k2_b_2,200000).
fine_max(d12_k2_b_2,250000).
original_vi_text(d12_k2_b_2,"sử dụng bàn trượt, pa-tanh, các thiết bị tương tự trên phần đường xe chạy").

rule(d12_k2_c).
rule_type(d12_k2_c,primary_violation).
article(d12_k2_c,12).
clause(d12_k2_c,2).
point(d12_k2_c,"c").
subject(d12_k2_c,individual).
action(d12_k2_c,dieu_khien_vat_the_bay_tau_bay_no_nguoi_lai_phuong_priority_bay_sieu).
fine_min(d12_k2_c,200000).
fine_max(d12_k2_c,250000).
original_vi_text(d12_k2_c,"Điều khiển vật thể bay, tàu bay không người lái, phương tiện bay siêu nhẹ hoạt động trong phạm vi khổ giới hạn đường bộ gây cản trở hoặc nguy cơ mất an toàn cho người, phương tiện tham gia giao thông đường bộ").

rule(d12_k2_d).
rule_type(d12_k2_d,primary_violation).
article(d12_k2_d,12).
clause(d12_k2_d,2).
point(d12_k2_d,"d").
subject(d12_k2_d,individual).
action(d12_k2_d,nguoi_duoc_cho_tren_vehicle_motor_car_vehicle_near_machine_cac_loai_vehicle_tuong).
fine_min(d12_k2_d,200000).
fine_max(d12_k2_d,250000).
original_vi_text(d12_k2_d,"Người được chở trên xe mô tô, xe gắn máy, các loại xe tương tự xe mô tô và các loại xe tương tự xe gắn máy sử dụng ô (dù)").

rule(d12_k2_dd).
rule_type(d12_k2_dd,primary_violation).
article(d12_k2_dd,12).
clause(d12_k2_dd,2).
point(d12_k2_dd,"dd").
subject(d12_k2_dd,individual).
action(d12_k2_dd,nguoi_duoc_cho_tren_vehicle_dap_vehicle_dap_machine_bam_keo_belt_vehicle_khac).
fine_min(d12_k2_dd,200000).
fine_max(d12_k2_dd,250000).
original_vi_text(d12_k2_dd,"Người được chở trên xe đạp, xe đạp máy bám, kéo, đẩy xe khác, vật khác, mang vác vật cồng kềnh").

rule(d12_k2_e).
rule_type(d12_k2_e,primary_violation).
article(d12_k2_e,12).
clause(d12_k2_e,2).
point(d12_k2_e,"e").
subject(d12_k2_e,individual).
action(d12_k2_e,ban_hang_rong_hoac_ban_hang_hoa_nho_le_khac_tren_long_road_tren).
context(d12_k2_e,sidewalk).
context(d12_k2_e,carriageway).
context(d12_k2_e,prohibited_sidewalk_sales_zone).
exception_ref(d12_k2_e,12,7,"all").
fine_min(d12_k2_e,200000).
fine_max(d12_k2_e,250000).
original_vi_text(d12_k2_e,"Bán hàng rong hoặc bán hàng hóa nhỏ lẻ khác trên lòng đường, trên vỉa hè các tuyến phố có quy định cấm bán hàng").

rule(d12_k2_g_1).
rule_type(d12_k2_g_1,primary_violation).
article(d12_k2_g_1,12).
clause(d12_k2_g_1,2).
point(d12_k2_g_1,"g").
subject(d12_k2_g_1,individual).
action(d12_k2_g_1,phoi_thoc_lua_rom_ra_alcohol_lam_hai_san_tren_road_bo).
fine_min(d12_k2_g_1,200000).
fine_max(d12_k2_g_1,250000).
original_vi_text(d12_k2_g_1,"Phơi thóc, lúa, rơm, rạ, nông, lâm, hải sản trên đường bộ").

rule(d12_k2_g_2).
rule_type(d12_k2_g_2,primary_violation).
article(d12_k2_g_2,12).
clause(d12_k2_g_2,2).
point(d12_k2_g_2,"g").
subject(d12_k2_g_2,individual).
action(d12_k2_g_2,dat_machine_tuot_lua_tren_road_bo).
fine_min(d12_k2_g_2,200000).
fine_max(d12_k2_g_2,250000).
original_vi_text(d12_k2_g_2,"đặt máy tuốt lúa trên đường bộ").

rule(d12_k3).
rule_type(d12_k3,primary_violation).
article(d12_k3,12).
clause(d12_k3,3).
subject(d12_k3,individual_or_organization).
action(d12_k3,vat_che_khuat_sign_signal_signal_road_bo_light_tin_signal_traffic_traffic).
fine_min_person(d12_k3,250000).
fine_max_person(d12_k3,350000).
fine_min_org(d12_k3,500000).
fine_max_org(d12_k3,700000).
original_vi_text(d12_k3,"vật che khuất biển báo hiệu đường bộ, đèn tín hiệu giao thông").

rule(d12_k4).
rule_type(d12_k4,primary_violation).
article(d12_k4,12).
clause(d12_k4,4).
subject(d12_k4,car_passenger).
action(d12_k4,no_seatbelt).
fine_min(d12_k4,350000).
fine_max(d12_k4,400000).
original_vi_text(d12_k4,"4. Phạt tiền từ 350.000 đồng đến 400.000 đồng đối với người được chở trên xe ô tô không thắt dây đai an toàn (tại vị trí có trang bị dây đai an toàn) khi xe đang chạy").

rule(d12_k5_a).
rule_type(d12_k5_a,primary_violation).
article(d12_k5_a,12).
clause(d12_k5_a,5).
point(d12_k5_a,"a").
subject(d12_k5_a,motorbike_passenger).
action(d12_k5_a,bam_keo_belt_vehicle_khac_vat_khac_residential_dat_vat_nuoi_mang_vac_vat).
fine_min(d12_k5_a,400000).
fine_max(d12_k5_a,600000).
original_vi_text(d12_k5_a,"Bám, kéo, đẩy xe khác, vật khác, dẫn dắt vật nuôi, mang vác vật cồng kềnh, đứng trên yên, giá đèo hàng hoặc ngồi trên tay lái của xe").

rule(d12_k5_b).
rule_type(d12_k5_b,primary_violation).
article(d12_k5_b,12).
clause(d12_k5_b,5).
point(d12_k5_b,"b").
subject(d12_k5_b,motorbike_passenger).
action(d12_k5_b,no_doi_mu_signal_hiem_cho_nguoi_go_motor_car_vehicle_machine_hoac_doi).
fine_min(d12_k5_b,400000).
fine_max(d12_k5_b,600000).
original_vi_text(d12_k5_b,"Không đội \"mũ bảo hiểm cho người đi mô tô, xe máy\" hoặc đội \"mũ bảo hiểm cho người đi mô tô, xe máy\" không cài quai đúng quy cách khi tham gia giao thông trên đường bộ").

rule(d12_k6_a).
rule_type(d12_k6_a,primary_violation).
article(d12_k6_a,12).
clause(d12_k6_a,6).
point(d12_k6_a,"a").
subject(d12_k6_a,individual_or_organization).
action(d12_k6_a,khi_co_dieu_kien_drug_co_y_no_cuu_giup_nguoi_bi_tai_nan).
fine_min_person(d12_k6_a,500000).
fine_max_person(d12_k6_a,1000000).
fine_min_org(d12_k6_a,1000000).
fine_max_org(d12_k6_a,2000000).
original_vi_text(d12_k6_a,"Khi có điều kiện mà cố ý không cứu giúp người bị tai nạn giao thông đường bộ").

rule(d12_k6_b).
rule_type(d12_k6_b,primary_violation).
article(d12_k6_b,12).
clause(d12_k6_b,6).
point(d12_k6_b,"b").
subject(d12_k6_b,individual_or_organization).
action(d12_k6_b,loi_stop_viec_xay_ra_tai_nan_traffic_traffic_road_bo_de_obey_hung).
fine_min_person(d12_k6_b,500000).
fine_max_person(d12_k6_b,1000000).
fine_min_org(d12_k6_b,1000000).
fine_max_org(d12_k6_b,2000000).
original_vi_text(d12_k6_b,"Lợi dụng việc xảy ra tai nạn giao thông đường bộ để hành hung, đe dọa, xúi giục, gây sức ép, làm mất trật tự, cản trở việc xử lý tai nạn giao thông đường bộ").

rule(d12_k6_c_1).
rule_type(d12_k6_c_1,primary_violation).
article(d12_k6_c_1,12).
clause(d12_k6_c_1,6).
point(d12_k6_c_1,"c").
subject(d12_k6_c_1,individual_or_organization).
action(d12_k6_c_1,can_tro_nguoi_phuong_priority_tham_gia_traffic_traffic_tren_road_bo).
fine_min_person(d12_k6_c_1,500000).
fine_max_person(d12_k6_c_1,1000000).
fine_min_org(d12_k6_c_1,1000000).
fine_max_org(d12_k6_c_1,2000000).
original_vi_text(d12_k6_c_1,"Cản trở người, phương tiện tham gia giao thông trên đường bộ").

rule(d12_k6_c_2).
rule_type(d12_k6_c_2,primary_violation).
article(d12_k6_c_2,12).
clause(d12_k6_c_2,6).
point(d12_k6_c_2,"c").
subject(d12_k6_c_2,individual_or_organization).
action(d12_k6_c_2,nem_gach_dat_da_cat_hoac_vat_the_khac_enter_nguoi_phuong_priority_dang).
fine_min_person(d12_k6_c_2,500000).
fine_max_person(d12_k6_c_2,1000000).
fine_min_org(d12_k6_c_2,1000000).
fine_max_org(d12_k6_c_2,2000000).
original_vi_text(d12_k6_c_2,"ném gạch, đất, đá, cát hoặc vật thể khác vào người, phương tiện đang tham gia giao thông trên đường bộ").

rule(d12_k6_d_1).
rule_type(d12_k6_d_1,primary_violation).
article(d12_k6_d_1,12).
clause(d12_k6_d_1,6).
point(d12_k6_d_1,"d").
subject(d12_k6_d_1,individual_or_organization).
action(d12_k6_d_1,chiem_stop_belt_phan_cach_giua_cua_road_doi_lam_noi_bay_ban_hang).
fine_min_person(d12_k6_d_1,500000).
fine_max_person(d12_k6_d_1,1000000).
fine_min_org(d12_k6_d_1,1000000).
fine_max_org(d12_k6_d_1,2000000).
original_vi_text(d12_k6_d_1,"Chiếm dụng dải phân cách giữa của đường đôi làm nơi: bày, bán hàng hóa").

rule(d12_k6_d_2).
rule_type(d12_k6_d_2,primary_violation).
article(d12_k6_d_2,12).
clause(d12_k6_d_2,6).
point(d12_k6_d_2,"d").
subject(d12_k6_d_2,individual_or_organization).
action(d12_k6_d_2,de_vat_lieu_xay_stop).
fine_min_person(d12_k6_d_2,500000).
fine_max_person(d12_k6_d_2,1000000).
fine_min_org(d12_k6_d_2,1000000).
fine_max_org(d12_k6_d_2,2000000).
original_vi_text(d12_k6_d_2,"để vật liệu xây dựng").

rule(d12_k6_d_3).
rule_type(d12_k6_d_3,primary_violation).
article(d12_k6_d_3,12).
clause(d12_k6_d_3,6).
point(d12_k6_d_3,"d").
subject(d12_k6_d_3,individual_or_organization).
action(d12_k6_d_3,de_vehicle_trong_giu_vehicle).
fine_min_person(d12_k6_d_3,500000).
fine_max_person(d12_k6_d_3,1000000).
fine_min_org(d12_k6_d_3,1000000).
fine_max_org(d12_k6_d_3,2000000).
original_vi_text(d12_k6_d_3,"để xe, trông, giữ xe").

rule(d12_k7_1).
rule_type(d12_k7_1,primary_violation).
article(d12_k7_1,12).
clause(d12_k7_1,7).
subject(d12_k7_1,individual_or_organization).
action(d12_k7_1,hop_cho).
fine_min_person(d12_k7_1,2000000).
fine_max_person(d12_k7_1,3000000).
fine_min_org(d12_k7_1,4000000).
fine_max_org(d12_k7_1,6000000).
original_vi_text(d12_k7_1,"họp chợ").

rule(d12_k7_2).
rule_type(d12_k7_2,primary_violation).
article(d12_k7_2,12).
clause(d12_k7_2,7).
subject(d12_k7_2,individual_or_organization).
action(d12_k7_2,kinh_doanh_dich_vu_safe_uong).
fine_min_person(d12_k7_2,2000000).
fine_max_person(d12_k7_2,3000000).
fine_min_org(d12_k7_2,4000000).
fine_max_org(d12_k7_2,6000000).
original_vi_text(d12_k7_2,"kinh doanh dịch vụ ăn uống").

rule(d12_k7_3).
rule_type(d12_k7_3,primary_violation).
article(d12_k7_3,12).
clause(d12_k7_3,7).
subject(d12_k7_3,individual_or_organization).
action(d12_k7_3,bay_ban_hang_hoa).
fine_min_person(d12_k7_3,2000000).
fine_max_person(d12_k7_3,3000000).
fine_min_org(d12_k7_3,4000000).
fine_max_org(d12_k7_3,6000000).
original_vi_text(d12_k7_3,"bày, bán hàng hóa").

rule(d12_k7_4).
rule_type(d12_k7_4,primary_violation).
article(d12_k7_4,12).
clause(d12_k7_4,7).
subject(d12_k7_4,individual_or_organization).
action(d12_k7_4,sua_chua_phuong_priority_machine_moc_thiet_bi).
fine_min_person(d12_k7_4,2000000).
fine_max_person(d12_k7_4,3000000).
fine_min_org(d12_k7_4,4000000).
fine_max_org(d12_k7_4,6000000).
original_vi_text(d12_k7_4,"sửa chữa phương tiện, máy móc, thiết bị").

rule(d12_k7_5).
rule_type(d12_k7_5,primary_violation).
article(d12_k7_5,12).
clause(d12_k7_5,7).
subject(d12_k7_5,individual_or_organization).
action(d12_k7_5,rua_vehicle).
fine_min_person(d12_k7_5,2000000).
fine_max_person(d12_k7_5,3000000).
fine_min_org(d12_k7_5,4000000).
fine_max_org(d12_k7_5,6000000).
original_vi_text(d12_k7_5,"rửa xe").

rule(d12_k7_6).
rule_type(d12_k7_6,primary_violation).
article(d12_k7_6,12).
clause(d12_k7_6,7).
subject(d12_k7_6,individual_or_organization).
action(d12_k7_6,dat_treo_sign_signal_sign_quang_highway).
fine_min_person(d12_k7_6,2000000).
fine_max_person(d12_k7_6,3000000).
fine_min_org(d12_k7_6,4000000).
fine_max_org(d12_k7_6,6000000).
original_vi_text(d12_k7_6,"đặt, treo biển hiệu, biển quảng cáo").

rule(d12_k8).
rule_type(d12_k8,primary_violation).
article(d12_k8,12).
clause(d12_k8,8).
subject(d12_k8,individual_or_organization).
action(d12_k8,8_phat_priority_tu_2_000_000_dong_light_4_000_000_dong_doi).
fine_min_person(d12_k8,2000000).
fine_max_person(d12_k8,4000000).
fine_min_org(d12_k8,4000000).
fine_max_org(d12_k8,8000000).
original_vi_text(d12_k8,"8. Phạt tiền từ 2.000.000 đồng đến 4.000.000 đồng đối với cá nhân, từ 4.000.000 đồng đến 8.000.000 đồng đối với tổ chức cố ý thay đổi, xóa dấu vết hiện trường vụ tai nạn giao thông").

rule(d12_k9).
rule_type(d12_k9,primary_violation).
article(d12_k9,12).
clause(d12_k9,9).
subject(d12_k9,individual_or_organization).
action(d12_k9,bay_ban_machine_moc_thiet_bi_vat_tu_hoac_san_xuat_gia_cong_hang).
context(d12_k9,carriageway).
fine_min_person(d12_k9,3000000).
fine_max_person(d12_k9,5000000).
fine_min_org(d12_k9,6000000).
fine_max_org(d12_k9,10000000).
original_vi_text(d12_k9,"bày, bán máy móc, thiết bị, vật tư hoặc sản xuất, gia công hàng hóa trên lòng đường, vỉa hè").

rule(d12_k10).
rule_type(d12_k10,primary_violation).
article(d12_k10,12).
clause(d12_k10,10).
subject(d12_k10,individual_or_organization).
action(d12_k10,no_obey_obey_yeu_bridge_kiem_tra_kiem_soat_cua_nguoi_thi_obey_cong).
fine_min_person(d12_k10,4000000).
fine_max_person(d12_k10,6000000).
fine_min_org(d12_k10,8000000).
fine_max_org(d12_k10,12000000).
original_vi_text(d12_k10,"không chấp hành yêu cầu kiểm tra, kiểm soát của người thi hành công vụ về bảo đảm trật tự, an toàn giao thông đường bộ").

rule(d12_k11_a_1).
rule_type(d12_k11_a_1,primary_violation).
article(d12_k11_a_1,12).
clause(d12_k11_a_1,11).
point(d12_k11_a_1,"a").
subject(d12_k11_a_1,individual).
action(d12_k11_a_1,dat_de_chuong_ngai_vat_vat_can_khac_left_permit_tren_road_bo).
fine_min(d12_k11_a_1,6000000).
fine_max(d12_k11_a_1,8000000).
original_vi_text(d12_k11_a_1,"Đặt, để chướng ngại vật, vật cản khác trái phép trên đường bộ").

rule(d12_k11_a_2).
rule_type(d12_k11_a_2,primary_violation).
article(d12_k11_a_2,12).
clause(d12_k11_a_2,11).
point(d12_k11_a_2,"a").
subject(d12_k11_a_2,individual).
action(d12_k11_a_2,level_chat_gay_tron_truot_tren_road_bo).
fine_min(d12_k11_a_2,6000000).
fine_max(d12_k11_a_2,8000000).
original_vi_text(d12_k11_a_2,"đổ chất gây trơn trượt trên đường bộ").

rule(d12_k11_a_3).
rule_type(d12_k11_a_3,primary_violation).
article(d12_k11_a_3,12).
clause(d12_k11_a_3,11).
point(d12_k11_a_3,"a").
subject(d12_k11_a_3,individual).
action(d12_k11_a_3,level_high_thai_lam_roi_vai_hoa_chat_chat_thai_gay_mat_safe_safety).
fine_min(d12_k11_a_3,6000000).
fine_max(d12_k11_a_3,8000000).
original_vi_text(d12_k11_a_3,"đổ, xả thải, làm rơi vãi hóa chất, chất thải gây mất an toàn giao thông đường bộ").

rule(d12_k11_b).
rule_type(d12_k11_b,primary_violation).
article(d12_k11_b,12).
clause(d12_k11_b,11).
point(d12_k11_b,"b").
subject(d12_k11_b,individual).
action(d12_k11_b,xam_pham_traffic_mang_suc_khoe_tai_san_cua_nguoi_bi_nan_nguoi_gay).
fine_min(d12_k11_b,6000000).
fine_max(d12_k11_b,8000000).
original_vi_text(d12_k11_b,"Xâm phạm tính mạng, sức khỏe, tài sản của người bị nạn, người gây tai nạn giao thông đường bộ hoặc người giúp đỡ, cứu chữa, đưa người bị nạn đi cấp cứu").

rule(d12_k11_c).
rule_type(d12_k11_c,primary_violation).
article(d12_k11_c,12).
clause(d12_k11_c,11).
point(d12_k11_c,"c").
subject(d12_k11_c,individual).
action(d12_k11_c,huy_hoai_lam_hu_hong_lam_mat_tac_stop_thiet_bi_dieu_khien_giam).
fine_min(d12_k11_c,6000000).
fine_max(d12_k11_c,8000000).
original_vi_text(d12_k11_c,"Hủy hoại, làm hư hỏng, làm mất tác dụng thiết bị điều khiển, giám sát giao thông đường bộ, thiết bị thông minh hỗ trợ chỉ huy, điều khiển giao thông đường bộ").

rule(d12_k12).
rule_type(d12_k12,primary_violation).
article(d12_k12,12).
clause(d12_k12,12).
subject(d12_k12,individual_or_organization).
action(d12_k12,use_stop_tam_thoi_long_road_sidewalk_sidewalk_enter_muc_dich_khac_theo_quy).
fine_min_person(d12_k12,10000000).
fine_max_person(d12_k12,15000000).
fine_min_org(d12_k12,20000000).
fine_max_org(d12_k12,30000000).
original_vi_text(d12_k12,"sử dụng tạm thời lòng đường, vỉa hè vào mục đích khác (theo quy định phải có giấy phép) mà không có giấy phép hoặc có giấy phép nhưng đã hết giá trị sử dụng hoặc thực hiện không đúng nội dung ghi trong giấy phép").

rule(d12_k13).
rule_type(d12_k13,primary_violation).
article(d12_k13,12).
clause(d12_k13,13).
subject(d12_k13,individual_or_organization).
action(d12_k13,no_khai_signal_khai_signal_gian_doi_hoac_cung_emergency_traffic_tin_tai_lieu).
fine_min_person(d12_k13,30000000).
fine_max_person(d12_k13,32000000).
fine_min_org(d12_k13,60000000).
fine_max_org(d12_k13,64000000).
original_vi_text(d12_k13,"không khai báo, khai báo gian dối hoặc cung cấp thông tin, tài liệu không đúng sự thật để trốn tránh trách nhiệm khi bị phát hiện vi phạm pháp luật về trật tự, an toàn giao thông đường bộ").

rule(d12_k14_a).
rule_type(d12_k14_a,primary_violation).
article(d12_k14_a,12).
clause(d12_k14_a,14).
point(d12_k14_a,"a").
subject(d12_k14_a,individual).
action(d12_k14_a,xuc_pham_de_doa_can_tro_chong_doi_nguoi_thi_obey_cong_vu_ve).
fine_min(d12_k14_a,35000000).
fine_max(d12_k14_a,37000000).
original_vi_text(d12_k14_a,"Xúc phạm, đe dọa, cản trở, chống đối người thi hành công vụ về bảo đảm trật tự, an toàn giao thông đường bộ").

rule(d12_k14_b).
rule_type(d12_k14_b,primary_violation).
article(d12_k14_b,12).
clause(d12_k14_b,14).
point(d12_k14_b,"b").
subject(d12_k14_b,individual).
action(d12_k14_b,rai_vat_sac_nhon_tren_road_bo).
fine_min(d12_k14_b,35000000).
fine_max(d12_k14_b,37000000).
original_vi_text(d12_k14_b,"Rải vật sắc nhọn trên đường bộ").

% Sanction / remedy / deduction clauses preserved from the source text
sanction_clause(s6_k14).
article(s6_k14,6).
clause(s6_k14,14).
subject(s6_k14,car).
sanction_type(s6_k14,confiscation).
original_vi_text(s6_k14,"14. Tịch thu phương tiện đối với người điều khiển xe tái phạm hành vi điều khiển xe lạng lách, đánh võng quy định tại khoản 12 Điều này").
applies_to_ref(s6_k14,6,12,"all").

sanction_clause(s6_k15).
article(s6_k15,6).
clause(s6_k15,15).
subject(s6_k15,car).
sanction_type(s6_k15,confiscation).
original_vi_text(s6_k15,"15. Ngoài việc bị phạt tiền, người điều khiển xe thực hiện hành vi vi phạm còn bị áp dụng các hình thức xử phạt bổ sung sau đây: a) Thực hiện hành vi quy định tại điểm e khoản 5 Điều này còn bị tịch thu thiết bị phát tín hiệu ưu tiên lắp đặt, sử dụng trái quy định; b) Thực hiện hành vi quy định tại khoản 12 Điều này bị tước quyền sử dụng giấy phép lái xe từ 10 tháng đến 12 tháng; c) Thực hiện hành vi quy định tại điểm a, điểm b, điểm c, điểm d khoản 11; khoản 13; khoản 14 Điều này bị tước quyền sử dụng giấy phép lái xe từ 22 tháng đến 24 tháng").
applies_to_ref(s6_k15,6,5,"e").
applies_to_ref(s6_k15,6,12,"all").
applies_to_ref(s6_k15,6,11,"a").
applies_to_ref(s6_k15,6,11,"b").
applies_to_ref(s6_k15,6,11,"c").
applies_to_ref(s6_k15,6,11,"d").
applies_to_ref(s6_k15,6,13,"all").
applies_to_ref(s6_k15,6,14,"all").

sanction_clause(s6_k16).
article(s6_k16,6).
clause(s6_k16,16).
subject(s6_k16,car).
sanction_type(s6_k16,license_point_deduction).
original_vi_text(s6_k16,"16. Ngoài việc bị áp dụng hình thức xử phạt, người điều khiển xe thực hiện hành vi vi phạm còn bị trừ điểm giấy phép lái xe như sau: a) Thực hiện hành vi quy định tại điểm h, điểm i khoản 3; điểm a, điểm b, điểm c, điểm d, điểm đ, điểm g khoản 4; điểm a, điểm b, điểm c, điểm d, điểm đ, điểm e, điểm g, điểm i, điểm k, điểm n, điểm o khoản 5 Điều này bị trừ điểm giấy phép lái xe 02 điểm; b) Thực hiện hành vi quy định tại điểm h khoản 5; khoản 6; điểm b khoản 7; điểm b, điểm c, điểm d khoản 9 Điều này bị trừ điểm giấy phép lái xe 04 điểm; c) Thực hiện hành vi quy định tại điểm p khoản 5; điểm a, điểm c khoản 7; khoản 8 Điều này bị trừ điểm giấy phép lái xe 06 điểm; d) Thực hiện hành vi quy định tại điểm a khoản 9, khoản 10, điểm đ khoản 11 Điều này bị trừ điểm giấy phép lái xe 10 điểm").
applies_to_ref(s6_k16,6,3,"gi").
applies_to_ref(s6_k16,6,3,"h").
applies_to_ref(s6_k16,6,3,"i").
applies_to_ref(s6_k16,6,4,"a").
applies_to_ref(s6_k16,6,4,"b").
applies_to_ref(s6_k16,6,4,"c").
applies_to_ref(s6_k16,6,4,"d").
applies_to_ref(s6_k16,6,4,"dd").
applies_to_ref(s6_k16,6,4,"g").
applies_to_ref(s6_k16,6,5,"a").
applies_to_ref(s6_k16,6,5,"b").
applies_to_ref(s6_k16,6,5,"c").
applies_to_ref(s6_k16,6,5,"d").
applies_to_ref(s6_k16,6,5,"dd").
applies_to_ref(s6_k16,6,5,"e").
applies_to_ref(s6_k16,6,5,"g").
applies_to_ref(s6_k16,6,5,"i").
applies_to_ref(s6_k16,6,5,"k").
applies_to_ref(s6_k16,6,5,"n").
applies_to_ref(s6_k16,6,5,"o").
applies_to_ref(s6_k16,6,5,"gi").
applies_to_ref(s6_k16,6,5,"h").
applies_to_ref(s6_k16,6,6,"all").
applies_to_ref(s6_k16,6,7,"b").
applies_to_ref(s6_k16,6,9,"b").
applies_to_ref(s6_k16,6,9,"c").
applies_to_ref(s6_k16,6,9,"d").
applies_to_ref(s6_k16,6,9,"gi").
applies_to_ref(s6_k16,6,5,"p").
applies_to_ref(s6_k16,6,7,"a").
applies_to_ref(s6_k16,6,7,"c").
applies_to_ref(s6_k16,6,8,"gi").
applies_to_ref(s6_k16,6,9,"a").
applies_to_ref(s6_k16,6,9,"dd").
applies_to_ref(s6_k16,6,9,"gi").

sanction_clause(s7_k11).
article(s7_k11,7).
clause(s7_k11,11).
subject(s7_k11,motorbike).
sanction_type(s7_k11,confiscation).
original_vi_text(s7_k11,"11. Tịch thu phương tiện đối với người điều khiển xe thực hiện một trong các hành vi vi phạm sau đây: a) Buông cả hai tay khi đang điều khiển xe; dùng chân điều khiển xe; ngồi về một bên điều khiển xe; nằm trên yên xe điều khiển xe; thay người điều khiển khi xe đang chạy; quay người về phía sau để điều khiển xe hoặc bịt mắt điều khiển xe; b) Điều khiển xe chạy bằng một bánh đối với xe hai bánh, chạy bằng hai bánh đối với xe ba bánh; c) Tái phạm hành vi điều khiển xe lạng lách, đánh võng quy định tại điểm a khoản 9 Điều này").
applies_to_ref(s7_k11,7,9,"a").

sanction_clause(s7_k12).
article(s7_k12,7).
clause(s7_k12,12).
subject(s7_k12,motorbike).
sanction_type(s7_k12,confiscation).
original_vi_text(s7_k12,"12. Ngoài việc bị áp dụng hình thức xử phạt chính, người điều khiển xe thực hiện hành vi vi phạm còn bị áp dụng các hình thức xử phạt bổ sung sau đây: a) Thực hiện hành vi quy định tại điểm đ khoản 2 Điều này còn bị tịch thu thiết bị phát tín hiệu ưu tiên lắp đặt, sử dụng trái quy định; b) Thực hiện hành vi quy định tại điểm a, điểm b, điểm h, điểm i, điểm k khoản 9 Điều này bị tước quyền sử dụng giấy phép lái xe từ 10 tháng đến 12 tháng; c) Thực hiện hành vi quy định tại điểm d, điểm đ, điểm e, điểm g khoản 9; khoản 11 Điều này bị tước quyền sử dụng giấy phép lái xe từ 22 tháng đến 24 tháng").
applies_to_ref(s7_k12,7,2,"dd").
applies_to_ref(s7_k12,7,9,"a").
applies_to_ref(s7_k12,7,9,"b").
applies_to_ref(s7_k12,7,9,"h").
applies_to_ref(s7_k12,7,9,"i").
applies_to_ref(s7_k12,7,9,"k").
applies_to_ref(s7_k12,7,9,"d").
applies_to_ref(s7_k12,7,9,"dd").
applies_to_ref(s7_k12,7,9,"e").
applies_to_ref(s7_k12,7,9,"g").
applies_to_ref(s7_k12,7,11,"all").

sanction_clause(s7_k13).
article(s7_k13,7).
clause(s7_k13,13).
subject(s7_k13,motorbike).
sanction_type(s7_k13,license_point_deduction).
original_vi_text(s7_k13,"13. Ngoài việc bị áp dụng hình thức xử phạt, người điều khiển xe thực hiện hành vi vi phạm còn bị trừ điểm giấy phép lái xe như sau: a) Thực hiện hành vi quy định tại điểm b khoản 3; khoản 5; điểm b, điểm c, điểm d khoản 6; điểm a khoản 7 Điều này bị trừ điểm giấy phép lái xe 02 điểm; b) Thực hiện hành vi quy định tại điểm đ khoản 4; điểm a khoản 6; điểm c, điểm d, điểm đ khoản 7; điểm a khoản 8 Điều này bị trừ điểm giấy phép lái xe 04 điểm; c) Thực hiện hành vi quy định tại điểm b khoản 7, điểm c khoản 9 Điều này bị trừ điểm giấy phép lái xe 06 điểm; d) Thực hiện hành vi quy định tại điểm b khoản 8, khoản 10 Điều này bị trừ điểm giấy phép lái xe 10 điểm").
applies_to_ref(s7_k13,7,3,"gi").
applies_to_ref(s7_k13,7,3,"b").
applies_to_ref(s7_k13,7,5,"all").
applies_to_ref(s7_k13,7,6,"b").
applies_to_ref(s7_k13,7,6,"c").
applies_to_ref(s7_k13,7,6,"d").
applies_to_ref(s7_k13,7,7,"a").
applies_to_ref(s7_k13,7,7,"gi").
applies_to_ref(s7_k13,7,4,"dd").
applies_to_ref(s7_k13,7,6,"a").
applies_to_ref(s7_k13,7,7,"c").
applies_to_ref(s7_k13,7,7,"d").
applies_to_ref(s7_k13,7,7,"dd").
applies_to_ref(s7_k13,7,8,"a").
applies_to_ref(s7_k13,7,8,"gi").
applies_to_ref(s7_k13,7,7,"b").
applies_to_ref(s7_k13,7,7,"c").
applies_to_ref(s7_k13,7,7,"gi").
applies_to_ref(s7_k13,7,8,"b").
applies_to_ref(s7_k13,7,8,"gi").

sanction_clause(s12_k15).
article(s12_k15,12).
clause(s12_k15,15).
subject(s12_k15,individual).
sanction_type(s12_k15,license_suspension).
original_vi_text(s12_k15,"15. Ngoài việc bị phạt tiền, cá nhân thực hiện hành vi quy định tại khoản 14 Điều này nếu là người điều khiển phương tiện còn bị áp dụng hình thức xử phạt bổ sung tước quyền sử dụng giấy phép lái xe từ 22 tháng đến 24 tháng").
applies_to_ref(s12_k15,12,14,"all").

sanction_clause(s12_k16).
article(s12_k16,12).
clause(s12_k16,16).
subject(s12_k16,individual_or_organization).
sanction_type(s12_k16,remedy).
original_vi_text(s12_k16,"16. Ngoài việc bị áp dụng hình thức xử phạt, cá nhân, tổ chức thực hiện hành vi vi phạm còn bị áp dụng các biện pháp khắc phục hậu quả sau đây: a) Thực hiện hành vi quy định tại khoản 3 Điều này buộc phá dỡ các vật che khuất biển báo hiệu đường bộ, đèn tín hiệu giao thông; b) Thực hiện hành vi quy định tại khoản 12 Điều này buộc khôi phục lại tình trạng ban đầu đã bị thay đổi do vi phạm hành chính gây ra").
applies_to_ref(s12_k16,12,3,"all").
applies_to_ref(s12_k16,12,12,"all").

sanction_clause(s12_k17).
article(s12_k17,12).
clause(s12_k17,17).
subject(s12_k17,individual).
sanction_type(s12_k17,license_point_deduction).
original_vi_text(s12_k17,"17. Ngoài việc bị áp dụng hình thức xử phạt, cá nhân thực hiện hành vi quy định tại điểm a, điểm b khoản 11 Điều này nếu là người điều khiển phương tiện bị trừ điểm giấy phép lái xe 02 điểm").
applies_to_ref(s12_k17,12,11,"a").
applies_to_ref(s12_k17,12,11,"b").
applies_to_ref(s12_k17,12,11,"gi").
