const displayLikeRank = () => {

  // 上記ビューの月間・週間・カスタムのそれぞれの要素を変数に代入
  const allLikeRankElement = document.getElementById("all_like_rank");
  const weekLikeRankElement = document.getElementById("week_like_rank");
  const monthLikeRankElement = document.getElementById("month_like_rank"); 
  const yearLikeRankElement = document.getElementById("custom_like_rank");

  // それぞれのラジオボタンの要素を変数に代入
  const allLikeRank = document.getElementById("like_rank_all");
  const weekLikeRank = document.getElementById("like_rank_week");
  const monthLikeRank = document.getElementById("like_rank_month");
  const yearLikeRank = document.getElementById("like_rank_year");
  console.log("switch likeRank")

  const switchLikeRank = () => {

    // どのラジオボタンにチェックが付いているかでどの要素のdisplayをblockにして、どれをnoneにするか指定
    if (allLikeRank.checked) {
      allLikeRankElement.style.display="block";
      weekLikeRankElement.style.display="none";
      monthLikeRankElement.style.display="none";
      yearLikeRankElement.style.display="none";
      sessionStorage.setItem('all', allLikeRank.checked = "true");
      sessionStorage.removeItem('week');
      sessionStorage.removeItem('month');
      sessionStorage.removeItem('year');
    }else if(weekLikeRank.checked) {
      allLikeRankElement.style.display="none";
      weekLikeRankElement.style.display="block";
      monthLikeRankElement.style.display="none";
      yearLikeRankElement.style.display="none";
      sessionStorage.removeItem('all');
      sessionStorage.setItem('week', weekLikeRank.checked = "true");
      sessionStorage.removeItem('month');
      sessionStorage.removeItem('year');
    }else if (monthLikeRank.checked) {
      allLikeRankElement.style.display="none";
      weekLikeRankElement.style.display="none";
      monthLikeRankElement.style.display="block";
      yearLikeRankElement.style.display="none";
      sessionStorage.removeItem('all');
      sessionStorage.removeItem('week');
      sessionStorage.setItem('month', monthLikeRank.checked = "true");
      sessionStorage.removeItem('year');
    }else if (yearLikeRank.checked) {
      allLikeRankElement.style.display="none";
      weekLikeRankElement.style.display="none";
      monthLikeRankElement.style.display="none";
      yearLikeRankElement.style.display="block";
      sessionStorage.removeItem('all');
      sessionStorage.removeItem('week');
      sessionStorage.removeItem('month');
      sessionStorage.setItem('year', yearLikeRank.checked = "true");
    }
  }
  window.addEventListener("click", switchLikeRank);
  window.addEventListener("load", switchLikeRank);
} 
window.addEventListener("load", displayLikeRank);