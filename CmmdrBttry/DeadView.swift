//
//  DeadView.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/25/24.
//

import SwiftUI

struct DeadView: View {
    var player: Player
    @State private var rotationAngle: Double = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                Color.black
                
                // ASCII Art (interactive)
                Button(action: {
                    // Generate random rotation angle between -180 and 180 degrees
                    let randomAngle = Double.random(in: -180...180)
                    withAnimation(.easeInOut(duration: 0.05)) {
                        rotationAngle += randomAngle
                    }
                }) {
                    Text("""

                          ...----....
                      ..-:"''         ''"-..
                   .-'                      '-.
                 .'              .     .       '.
               .'   .          .    .      .    .''.
             .'  .    .       .   .   .     .   . ..:.
           .' .   . .  .       .   .   ..  .   . ....::.
          ..   .   .      .  .    .     .  ..  . ....:IA.
         .:  .   .    .    .  .  .    .. .  .. .. ....:IA.
        .: .   .   ..   .    .     . . .. . ... ....:.:VHA.
        '..  .  .. .   .       .  . .. . .. . .....:.::IHHB.
       .:. .  . .  . .   .  .  . . . ...:.:... .......:HIHMM.
      .:.... .   . ."::"'.. .   .  . .:.:.:II;,. .. ..:IHIMMA
      ':.:..  ..::IHHHHHI::. . .  ...:.::::.,,,. . ....VIMMHM
     .:::I. .AHHHHHHHHHHAI::. .:...,:IIHHHHHHMMMHHL:. . VMMMM
    .:.:V.:IVHHHHHHHMHMHHH::..:" .:HIHHHHHHHHHHHHHMHHA. .VMMM.
    :..V.:IVHHHHHMMHHHHHHHB... . .:VPHHMHHHMMHHHHHHHHHAI.:VMMI
    ::V..:VIHHHHHHMMMHHHHHH. .   .I":IIMHHMMHHHHHHHHHHHAPI:WMM
    ::". .:.HHHHHHHHMMHHHHHI.  . .:..I:MHMMHHHHHHHHHMHV:':H:WM
    :: . :.::IIHHHHHHMMHHHHV  .ABA.:.:IMHMHMMMHMHHHHV:'. .IHWW
    '.  ..:..:.:IHHHHHMMHV" .AVMHMA.:.'VHMMMMHHHHHV:' .  :IHWV
     :.  .:...:".:.:TPP"   .AVMMHMMA.:. "VMMHHHP.:... .. :IVAI
    .:.   '... .:"'   .   ..HMMMHMMMA::. ."VHHI:::....  .:IHW'
    ...  .  . ..:IIPPIH: ..HMMMI.MMMV:I:.  .:ILLH:.. ...:I:IM
  : .   .'"' .:.V". .. .  :HMMM:IMMMI::I. ..:HHIIPPHI::'.P:HM.
  :.  .  .  .. ..:.. .    :AMMM IMMMM..:...:IV":T::I::.".:IHIMA
  'V:.. .. . .. .  .  .   'VMMV..VMMV :....:V:.:..:....::IHHHMH
    "IHH:.II:.. .:. .  . . . " :HB"" . . ..PI:.::.:::..:IHHMMV"
     :IP""HHII:.  .  .    . . .'V:. . . ..:IH:.:.::IHIHHMMMMM"
     :V:. VIMA:I..  .     .  . .. . .  .:.I:I:..:IHHHHMMHHMMM
     :"VI:.VWMA::. .:      .   .. .:. ..:.I::.:IVHHHMMMHMMMMI
     :."VIIHHMMA:.  .   .   .:  .:.. . .:.II:I:AMMMMMMHMMMMMI
     :..VIHIHMMMI...::.,:.,:!"I:!"I!"I!"V:AI:VAMMMMMMHMMMMMM'
     ':.:HIHIMHHA:"!!"I.:AXXXVVXXXXXXXA:."HPHIMMMMHHMHMMMMMV
       V:H:I:MA:W'I :AXXXIXII:IIIISSSSSSXXA.I.VMMMHMHMMMMMM
         'I::IVA ASSSSXSSSSBBSBMBSSSSSSBBMMMBS.VVMMHIMM'"'
          I:: VPAIMSSSSSSSSSBSSSMMBSSSBBMMMMXXI:MMHIMMI
         .I::. "H:XIIXBBMMMMMMMMMMMMMMMMMBXIXXMMPHIIMM'
         :::I.  ':XSSXXIIIIXSSBMBSSXXXIIIXXSMMAMI:.IMM
         :::I:.  .VSSSSSISISISSSBII:ISSSSBMMB:MI:..:MM
         ::.I:.  ':"SSSSSSSISISSXIIXSSSSBMMB:AHI:..MMM.
         ::.I:. . ..:"BBSSSSSSSSSSSSBBBMMMB:AHHI::.HMMI
         :..::.  . ..::":BBBBBSSBBBMMMB:MMMMHHII::IHHMI
         ':.I:... ....:IHHHHHMMMMMMMMMMMMMMMHHIIIIHMMV"
           "V:. ..:...:.IHHHMMMMMMMMMMMMMMMMHHHMHHMHP'
            ':. .:::.:.::III::IHHHHMMMMMHMHMMHHHHM"
              "::....::.:::..:..::IIIIIHHHHMMMHHMV"
                "::.::.. .. .  ...:::IIHHMMMMHMV"
                  "V::... . .I::IHHMMV"'
                    '"VHVHHHAHHHHMMV:"'

""")
                        .font(.system(size: 3, weight: .regular, design: .monospaced))
                        .foregroundColor(.red)
                        .multilineTextAlignment(.leading)
                        .rotationEffect(.degrees(rotationAngle))
                }
                .buttonStyle(PlainButtonStyle())
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
        }
        .frame(height: 190)
        .background(.black)
    }
}

#Preview {
    DeadView(player: Player(name: "Joseph", health: 0, color: "Red"))
        .previewLayout(.sizeThatFits)
}
