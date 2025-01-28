document.addEventListener('DOMContentLoaded', function () {
    const page = document.querySelector('.formulir-list');
    const form = document.querySelector('.formulir-form');
    const filterButtons = document.querySelectorAll('.formulir-filter-button');
    const rows = Array.from(document.querySelectorAll('.formulir-table tbody tr'));
    const addButton = document.querySelector('.formulir-add-button');
    const closeButton = document.querySelector('.formulir-form .formulir-form-cancel');
    const paginationContainer = document.querySelector('.pagination');
    const prevButton = paginationContainer.querySelector('button:first-child');
    const nextButton = paginationContainer.querySelector('button:last-child');
    const maxRowsPerPage = 8;
    let currentPage = 1;

    // Fungsi untuk menampilkan baris berdasarkan halaman
    function showPage(page) {
        const startIndex = (page - 1) * maxRowsPerPage;
        const endIndex = startIndex + maxRowsPerPage;

        rows.forEach((row, index) => {
            if (index >= startIndex && index < endIndex) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });

        // Update tombol pagination
        updatePaginationButtons(page);
    }

    // Fungsi untuk memperbarui tombol pagination
    function updatePaginationButtons(page) {
        const totalPages = Math.ceil(rows.length / maxRowsPerPage);

        prevButton.style.display = page > 1 ? '' : 'none';
        nextButton.style.display = page < totalPages ? '' : 'none';

        // Tambahkan nomor halaman
        if (!paginationContainer.querySelector('.page-info')) {
            const pageInfo = document.createElement('span');
            pageInfo.className = 'page-info';
            paginationContainer.insertBefore(pageInfo, nextButton);
        }

        const pageInfo = paginationContainer.querySelector('.page-info');
        pageInfo.textContent = `Halaman ${page} dari ${totalPages}`;
    }

    // Event listener untuk tombol pagination
    prevButton.addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            showPage(currentPage);
        }
    });

    nextButton.addEventListener('click', () => {
        const totalPages = Math.ceil(rows.length / maxRowsPerPage);
        if (currentPage < totalPages) {
            currentPage++;
            showPage(currentPage);
        }
    });

    // Fungsi untuk menyaring tabel berdasarkan filter
    function filterTable(filter) {
        // Filter rows berdasarkan status
        const filteredRows = rows.filter(row => {
            const statusTag = row.querySelector('.tag'); // Ambil elemen dengan class 'tag'
            const status = statusTag ? statusTag.textContent.trim().toLowerCase() : ''; // Ambil teks dari tag
            return filter.toLowerCase() === 'semua' || status === filter.toLowerCase(); // Cocokkan filter
        });
    
        // Sembunyikan semua baris
        rows.forEach(row => (row.style.display = 'none'));
    
        // Tampilkan baris yang cocok dengan filter, batasi sesuai jumlah per halaman
        filteredRows.forEach((row, index) => {
            row.style.display = index < maxRowsPerPage ? '' : 'none';
        });
    
        // Reset ke halaman pertama
        currentPage = 1;
        updatePaginationButtons(currentPage);
    }
    

    // Event listener untuk tombol filter
    filterButtons.forEach(button => {
        button.addEventListener('click', () => {
            const filter = button.textContent.trim();

            filterButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');

            filterTable(filter);
        });
    });

    // Fungsi untuk menampilkan formulir
    function showForm() {
        page.style.display = 'none';
        form.style.display = 'block';
    }

    // Fungsi untuk kembali ke daftar formulir
    function hideForm() {
        form.style.display = 'none';
        page.style.display = 'block';
    }

    // Event listener untuk tombol tambah
    if (addButton) {
        addButton.addEventListener('click', showForm);
    }

    // Event listener untuk tombol tutup formulir
    if (closeButton) {
        closeButton.addEventListener('click', hideForm);
    }

    // Tampilkan halaman pertama saat memuat
    showPage(currentPage);
});
