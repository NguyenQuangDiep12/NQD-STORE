document.getElementById('inputSearch').addEventListener('keyup', function () {
    const query = this.value.trim(); // Lấy giá trị nhập vào
    const tableBody = document.getElementById('productTableBody'); // Lấy tbody để cập nhật
    const tableContainer = document.getElementById('productTableContainer'); // Lấy container chứa bảng

    if (query === '') {
        tableBody.innerHTML = ''; // Xóa bảng nếu ô tìm kiếm rỗng
        tableContainer.style.display = 'none'; // Ẩn bảng
        return;
    }

    // Gửi yêu cầu AJAX tới controller
    fetch(`/admin/edit-product-search?name=${encodeURIComponent(query)}`, {
        method: 'GET',
        headers: { 'X-Requested-With': 'XMLHttpRequest' }
    })
    .then(response => response.text()) // Chuyển response sang dạng HTML
    .then(html => {
        // Cập nhật nội dung của tbody bằng HTML nhận được
        tableBody.innerHTML = html;
        
        // Nếu có kết quả, hiển thị bảng
        if (html.trim() !== '') {
            tableContainer.style.display = 'block'; // Hiển thị bảng
        } else {
            tableContainer.style.display = 'none'; // Ẩn bảng nếu không có kết quả
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
});
