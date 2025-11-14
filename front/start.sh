#!/bin/bash

echo "=================================="
echo "프론트엔드 서버 시작"
echo "=================================="

# 프론트엔드 디렉토리로 이동
cd "$(dirname "$0")"

# 의존성 설치
echo "의존성 설치 중..."
npm install

# 기존 프로세스 종료
echo "기존 프로세스 종료 중..."
pkill -f "vite" || true
sleep 1

# 서버 시작
echo "Vite 개발 서버 시작 중..."
nohup npm run dev -- --host 0.0.0.0 > vite.log 2>&1 & disown

echo "=================================="
echo "프론트엔드 서버가 백그라운드에서 실행 중입니다."
echo "로그 확인: tail -f vite.log"
echo "=================================="
