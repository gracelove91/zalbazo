$(document)
		.ready(
				function() {
					console.log("mypage_myfavorite");
					var userEmail = '<c:out value="${useremail}"/>';
//					var hh = '<c:out value="${hospitalId}"/>';
					
					var fhlist = $(".fhlist");
					var fhremove = $(".fhremove");
					// var fhlabel = $(".fhlabel");


					myFavoriteHospitalService
							.getList(
									userEmail,
									function(list) {

										var str = "";

										if (list == null || list.length == 0) {
											return;
										}

										for (var i = 0, len = list.length || 0; i < len; i++) {

											console.log(list[i]);

											str += "<tr>";
											str += "	<th scope='row' class='mobile' style='width: 150px; text-align:center;'>"
													+ list[i].hospitalId
													+ "</th>";

											str += "<td style='width: 600px; text-align: center;'>";
											str += "  <a class='move' style='color : #000000;' href='/hospital/get?hospitalId="
													+ list[i].hospitalId
													+ "'>"
													+ list[i].name + "</a>";
											str += "</td>";

											str += "<td style='width: 700px; text-align: center;'>";
											str += "  <a class='move' style='color : #000000;'>"
													+ list[i].address + "</a>";
											str += "</td>";

											str += "<td style='width: 300px; text-align: center;'>";
											str += "  <a class='move' style='color : #000000;'>"
													+ list[i].tel + "</a>";
											str += "</td>";

											str += "<td style='width: 350px; text-align: center;'>";

											str += "<a class='move' style='color : #000000;' >";
											str += "<button class='fhremove' data-id='"+list[i].hospitalId+ "'data-bt='btn'>삭제</button>";
											str += "</a></td>";

											str += "</tr>";
											
										}
											fhlist.html(str);

											// 이 서비스.을 주석처리하면 버튼 이벤트는 되는데...
//											myFavoriteHospitalService
//											.removeMyFavorite(
//													userEmail,
//													function(list) {
														fhlist.on("click", ".fhremove", function(list, e){
															
															var hId = $(this).attr("data-id");
															var info = $(".info");
															var hospitalId = info.find("input[name='hospitalId']");
															alert("삭제버튼은 눌렸다리 "+list[i].hospitalId);
															
															if (hId==hospitalId) {
																alert("결과는 hId==" + list[i].hospitalId);
																
																myFavoriteHospitalService.removeMyFavorite(hId,
																		function(removeResult){
																	alert("삭제되었습니다.");
																	console.log(removeResult);
																	console.log("즐찾 삭제 성공쓰");
																});
															 
															}
//															fhremove.html(str);
														});
													});		
											
//									});
				});