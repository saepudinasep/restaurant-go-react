import { useCallback } from 'react'
import axiosClient from '../api/axiosClient'
import DashboardLayout from '../components/DashboardLayout'

export default function DashboardCashier() {
  const fetchData = useCallback(async () => {
    const res = await axiosClient.get('/cashier/dashboard')
    return res.data.data
  }, [])

  return (
    <DashboardLayout
      title="Dashboard Cashier"
      subtitle="Ringkasan transaksi dan pendapatan kamu di sini."
      fetchData={fetchData}
    />
  )
}
