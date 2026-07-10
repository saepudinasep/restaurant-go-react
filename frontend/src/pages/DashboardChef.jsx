import { useCallback } from 'react'
import axiosClient from '../api/axiosClient'
import DashboardLayout from '../components/DashboardLayout'

export default function DashboardChef() {
  const fetchData = useCallback(async () => {
    const res = await axiosClient.get('/chef/dashboard')
    return res.data.data
  }, [])

  return (
    <DashboardLayout
      title="Dashboard Chef"
      subtitle="Ringkasan tugas dan aktivitas yang kamu ampu."
      fetchData={fetchData}
    />
  )
}
