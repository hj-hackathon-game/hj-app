class ProblemController

  def self.request
    problem = Problem.order_by(:result.desc).first
    {
        id: problem[:id],
        description: problem[:description],
    }
  end

  def self.answer(id, ans, time)
    raise BadRequestError unless (id.is_a?Integer) && (ans.is_a?Integer) && (time.is_a?Float)
    
  end

  def self.init
    Problem.create(
        id: 0,
        description: "Telecommunications devices ____ different types of information into electronic signals.\r\nA. convert\r\nB. alter\r\nC. modify\r\nD exchange\r\n",
        answer: 0
    )
    Problem.create(
        id: 1,
        description: "The endless public appearances and shaking of hands are an inevitable part of an election___.\r\nA champagne\r\nB. campaign\r\nC. conquest\r\nD. champion\r\n",
        answer: 1
    )
    Problem.create(
        id: 2,
        description: "The assembly line is designed to make possible the ____ of more goods with ferer workers.\r\nA. launch\r\nB. revolution\r\nC. installment\r\nD. manufacture\r\n",
        answer: 3
    )
    Problem.create(
        id: 3,
        description: "If you do not keep training,your victory may be like a one-time lottery win(中彩),which you cannot ____ over the long run.\r\nA bond with\r\nB. capitalize on\r\nC refer on\r\nD. specialize in\r\n",
        answer: 1
    )
    Problem.create(
        id: 4,
        description: "Wind power is a/an  ________ to the conventional fuels like coal and petrol.\r\nA.resistance\r\nB.alternative	\r\nC.occupation	\r\nD.tactic\r\n",
        answer: 1
    )
    Problem.create(
        id: 5,
        description: "Before Anglo-American westward _______, North America had been shaped by their many cultures.\r\nA.expansion	\r\nB.extension	\r\nC.construction		\r\nD.obstruction\r\n",
        answer: 0
    )
    Problem.create(
        id: 6,
        description: "These measures will increase the club‘s ability to ___income.\r\nA.inherit\r\nB.secure\r\nC.generate\r\nD.enhance\r\n",
        answer: 2
    )
    Problem.create(
        id: 7,
        description: "He was __ in 1965 for attempted murder.\r\nA.imprisoned\r\nB.pursued\r\nC.enslaved\r\nD.disposed\r\n",
        answer: 0
    )
    Problem.create(
        id: 8,
        description: "The fields were ______ in sunlight.\r\nA.indulged\r\nB.immersed\r\nC.absorbed\r\nD.bathed\r\n",
        answer: 3
    )
    Problem.create(
        id: 9,
        description: "We are going to ___a fight to keep you here,Mr Manning\r\nA.put across\r\nB.put on\r\nC.put off\r\nD.put up\r\n",
        answer: 3
    )
  end
end

class BadRequestError < StandardError; end