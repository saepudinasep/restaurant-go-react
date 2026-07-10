package handler

import (
	"net/http"

	"github.com/gin-gonic/gin"

	"backend/pkg/response"
)

type DashboardHandler struct{}

func NewDashboardHandler() *DashboardHandler {
	return &DashboardHandler{}
}

// StatCard merepresentasikan satu kartu ringkasan angka di dashboard (dipetakan ke komponen stat-card di frontend)
type StatCard struct {
	Label string `json:"label"`
	Value string `json:"value"`
	Sub   string `json:"sub"`
	Color string `json:"color"` // blue | green | amber | red — dipetakan ke warna aksen kartu
	Icon  string `json:"icon"`  // dashboard | users | book | kelas | laporan | calendar | check
}

// ActivityItem merepresentasikan satu baris di panel "Aktivitas Terkini"
type ActivityItem struct {
	Label string `json:"label"`
	Sub   string `json:"sub"`
}

// NOTE: Angka pada stats & activity di bawah ini masih data contoh (belum terhubung ke query MySQL).
// Struktur response sudah didesain agar tinggal diisi hasil query nyata (COUNT casshier, rata-rata nilai, dst)
// tanpa perlu mengubah kontrak API atau tampilan frontend.

// AdminDashboard menangani GET /api/admin/dashboard (hanya role admin)
func (h *DashboardHandler) AdminDashboard(c *gin.Context) {
	response.Success(c, http.StatusOK, "selamat datang di dashboard admin", gin.H{
		"stats": []StatCard{
			{Label: "Total Chef", Value: "12", Sub: "Aktif mengajar", Color: "blue", Icon: "users"},
			{Label: "Total Cashier", Value: "248", Sub: "6 kelas aktif", Color: "green", Icon: "users"},
			{Label: "Kelas Aktif", Value: "6", Sub: "Tahun ajaran 2025/2026", Color: "amber", Icon: "kelas"},
			{Label: "Akun Terdaftar", Value: "261", Sub: "Semua role", Color: "blue", Icon: "check"},
		},
		"activities": []ActivityItem{
			{Label: "Chef baru ditambahkan", Sub: "Budi Chef · 2 jam lalu"},
			{Label: "Kelas baru dibuat", Sub: "Kelas 9C · kemarin"},
			{Label: "Cashier baru mendaftar", Sub: "Siti Cashier · 2 hari lalu"},
		},
	})
}

// ChefDashboard menangani GET /api/chef/dashboard (hanya role chef)
func (h *DashboardHandler) ChefDashboard(c *gin.Context) {
	response.Success(c, http.StatusOK, "selamat datang di dashboard chef", gin.H{
		"stats": []StatCard{
			{Label: "Kelas Diampu", Value: "3", Sub: "Semester genap", Color: "blue", Icon: "kelas"},
			{Label: "Total Cashier", Value: "84", Sub: "Di semua kelas", Color: "green", Icon: "users"},
			{Label: "Tugas Belum Dinilai", Value: "5", Sub: "Perlu ditindaklanjuti", Color: "amber", Icon: "book"},
			{Label: "Kehadiran Hari Ini", Value: "92%", Sub: "Kelas 9A", Color: "green", Icon: "calendar"},
		},
		"activities": []ActivityItem{
			{Label: "Nilai ulangan diinput", Sub: "Kelas 9A · Matematika · 1 jam lalu"},
			{Label: "Presensi tercatat", Sub: "Kelas 9B · hari ini"},
			{Label: "Tugas baru diberikan", Sub: "Kelas 9C · kemarin"},
		},
	})
}

// CashierDashboard menangani GET /api/cashier/dashboard (hanya role cashier)
func (h *DashboardHandler) CashierDashboard(c *gin.Context) {
	response.Success(c, http.StatusOK, "selamat datang di dashboard cashier", gin.H{
		"stats": []StatCard{
			{Label: "Total Transaksi", Value: "120", Sub: "Hari ini", Color: "blue", Icon: "check"},
			{Label: "Pendapatan", Value: "Rp 1.200.000", Sub: "Hari ini", Color: "green", Icon: "calendar"},
			{Label: "Tugas Aktif", Value: "2", Sub: "Menunggu dikumpulkan", Color: "amber", Icon: "book"},
			{Label: "Jadwal Hari Ini", Value: "4", Sub: "Mata pelajaran", Color: "blue", Icon: "kelas"},
		},
		"activities": []ActivityItem{
			{Label: "Nilai ulangan terbit", Sub: "Matematika · 87 · 1 hari lalu"},
			{Label: "Presensi tercatat hadir", Sub: "Hari ini · 07:15"},
			{Label: "Tugas baru diberikan", Sub: "Bahasa Indonesia · kemarin"},
		},
	})
}
