$startLoc = Get-Location
Set-Location "C:\Users\gregg\Documents\kubectl-convert"
if ($($(CertUtil -hashfile .\kubectl-convert.exe SHA256)[1] -replace " ", "") -eq $(Get-Content .\kubectl-convert.exe.sha256)) {
	kubectl convert --help
}
Set-Location $startLoc