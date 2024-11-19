package com.laptop.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "customers")
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty
	private String name;

	@NotEmpty
	private String email;

	@NotNull
	private String phone;

	@NotEmpty
	private String password; // luu tru bam

	@OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "cart_id") // khoa ngoai cua bang Customer
	private Cart cart;

	@OneToMany(mappedBy = "customer", fetch = FetchType.LAZY)
	private List<Order> order;

	/*
	 * Trong Hibernate/JPA, khi sử dụng quan hệ @OneToOne,
	 * bạn có thể áp dụng tính năng cascade để chỉ định các hoạt động như PERSIST,
	 * REMOVE, MERGE, v.v.,
	 * sẽ được tự động thực hiện trên thực thể liên kết. Điều này rất hữu ích khi
	 * bạn muốn các thao tác
	 * trên một thực thể gốc sẽ tự động ảnh hưởng đến thực thể con liên quan mà
	 * không cần thực hiện thủ công.
	 * Các loại Cascade trong JPA:
	 * CascadeType.PERSIST: Khi persist đối tượng gốc, đối tượng liên quan cũng được
	 * lưu.
	 * CascadeType.REMOVE: Khi remove đối tượng gốc, đối tượng liên quan cũng bị
	 * xóa.
	 * CascadeType.MERGE: Khi merge đối tượng gốc, đối tượng liên quan cũng được cập
	 * nhật.
	 * CascadeType.DETACH: Khi đối tượng gốc bị tách khỏi phiên, đối tượng liên quan
	 * cũng tách theo.
	 * CascadeType.REFRESH: Làm mới đối tượng liên quan khi đối tượng gốc được làm
	 * mới.
	 * CascadeType.ALL: Áp dụng tất cả các loại cascade trên.
	 * Bạn có thể tùy chỉnh cascade phù hợp với các yêu cầu cụ thể của mình.
	 * 
	 * CascadeType.REMOVE chỉ xóa thực thể liên quan khi thực thể gốc bị xóa.
	 * Ví dụ, khi bạn xóa Person, Address liên quan cũng sẽ bị xóa.
	 * orphanRemoval xóa thực thể liên quan khi mối quan hệ giữa hai thực thể bị cắt
	 * đứt
	 * (khi thực thể con không còn tham chiếu từ thực thể cha nữa).
	 */
}
